From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 27 Nov 2018 00:42:55 -0200
Subject: [Buildroot] [PATCH/next 2/3] support/testing; add prosody test
References: <20181124090754.14775-3-francois.perrad@gadz.org>
Message-ID: <5bfcaf2f1383c_36673f995613474457487@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Nov 24, 2018 at 07:07 AM, Francois Perrad wrote:

> +    def prosody_test(self):
> +        # prosody was launched as service
> +        cmd = "prosodyctl status"
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        self.assertIn("Prosody is running", output[0])

I get an error message before the expected string:

# prosodyctl status
certmanager         error       SSL/TLS: Error initialising for client_https port 0: unknown elliptic curve in "X25519:P-384:P-256:P-521"
Prosody is running with PID 727
#

https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/125808115

I don't know if this message is expected in this minimal config or not.
If it is expected, we could add a comment and run something like this:
        self.assertIn("Prosody is running", output[1])

Any ideas?


Regards,
Ricardo
