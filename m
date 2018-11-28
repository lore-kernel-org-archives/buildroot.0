From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 28 Nov 2018 00:13:43 -0200
Subject: [Buildroot] [PATCH/next 2/3] support/testing; add prosody test
References: <CAB0FRsvw_HD0ruuK5jMwVd+Oi5C7yYWGQFYcVyK6cS4V=J9dNg@mail.gmail.com>
Message-ID: <5bfdf9d718fbb_66b73f9fcc01bd189614b@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Nov 27, 2018 at 02:52 AM, Fran?ois Perrad wrote:

> Le mar. 27 nov. 2018 ? 03:43, Ricardo Martincoski <
> ricardo.martincoski at gmail.com> a ?crit :
>>
>> On Sat, Nov 24, 2018 at 07:07 AM, Francois Perrad wrote:
>>
>> > +    def prosody_test(self):
>> > +        # prosody was launched as service
>> > +        cmd = "prosodyctl status"
>> > +        output, exit_code = self.emulator.run(cmd)
>> > +        self.assertEqual(exit_code, 0)
>> > +        self.assertIn("Prosody is running", output[0])
>>
>> I get an error message before the expected string:
>>
>> # prosodyctl status
>> certmanager         error       SSL/TLS: Error initialising for
>> client_https port 0: unknown elliptic curve in "X25519:P-384:P-256:P-521"
>> Prosody is running with PID 727
>> #
>>
>> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/125808115
>>
>> I don't know if this message is expected in this minimal config or not.
>> If it is expected, we could add a comment and run something like this:
>>         self.assertIn("Prosody is running", output[1])
>>
>> Any ideas?
>>
>>
> We use the same "minimal" config.
> We have a reproductibility issue.
> I run test_prosody on my local box : "Prosody is running" is in output[0]
> You run the same test in Gitlab CI : "Prosody is running" is in output[1]
> 
> Could you try to run the test locally ?

Sure.

Calling run-tests locally (based on next branch 06a2d67c) also generates the
same error message and displays "Prosody is running" is in output[1]

But then I rebased the tests to the master branch (1209eb2d) and called
run-tests locally.
No error message and "Prosody is running" is in output[0]
And the same good result (based on master) on the GitLab CI
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/126437379

So it looks something related to the next branch.

Finally I merged master to next+tests and the test case passes.
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/126443939

So it looks something already fixed on master branch.

And I can add my tags to your patches (not today due to the lack of time).
Sorry for the noise.


Regards,
Ricardo
