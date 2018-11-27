From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 27 Nov 2018 05:52:47 +0100
Subject: [Buildroot] [PATCH/next 2/3] support/testing; add prosody test
In-Reply-To: <5bfcaf2f1383c_36673f995613474457487@ultri5.mail>
References: <20181124090754.14775-3-francois.perrad@gadz.org>
 <5bfcaf2f1383c_36673f995613474457487@ultri5.mail>
Message-ID: <CAB0FRsvw_HD0ruuK5jMwVd+Oi5C7yYWGQFYcVyK6cS4V=J9dNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mar. 27 nov. 2018 ? 03:43, Ricardo Martincoski <
ricardo.martincoski@gmail.com> a ?crit :

> Hello,
>
> On Sat, Nov 24, 2018 at 07:07 AM, Francois Perrad wrote:
>
> > +    def prosody_test(self):
> > +        # prosody was launched as service
> > +        cmd = "prosodyctl status"
> > +        output, exit_code = self.emulator.run(cmd)
> > +        self.assertEqual(exit_code, 0)
> > +        self.assertIn("Prosody is running", output[0])
>
> I get an error message before the expected string:
>
> # prosodyctl status
> certmanager         error       SSL/TLS: Error initialising for
> client_https port 0: unknown elliptic curve in "X25519:P-384:P-256:P-521"
> Prosody is running with PID 727
> #
>
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/125808115
>
> I don't know if this message is expected in this minimal config or not.
> If it is expected, we could add a comment and run something like this:
>         self.assertIn("Prosody is running", output[1])
>
> Any ideas?
>
>
We use the same "minimal" config.
We have a reproductibility issue.
I run test_prosody on my local box : "Prosody is running" is in output[0]
You run the same test in Gitlab CI : "Prosody is running" is in output[1]

Could you try to run the test locally ?

Fran?ois


>
> Regards,
> Ricardo_______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181127/b999f5fb/attachment.html>
