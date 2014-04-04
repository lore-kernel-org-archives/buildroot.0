From: Vincent =?utf-8?b?U3RlaGzDqQ==?= <vincent.stehle@laposte.net>
Date: Fri, 4 Apr 2014 21:21:46 +0000 (UTC)
Subject: [Buildroot] host-binutils broken?
References: <533EED51.9090204@freescale.com>
 <CAMo8BfJhxpqBFmFeADF97cKbANtzNFYy2_L=wrMjLn8zUtinyw@mail.gmail.com>
Message-ID: <loom.20140404T230545-334@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Max Filippov <jcmvbkbc@...> writes:
> I couldn't reproduce it,
(..)
> Could you please share your .config and build log?

Hi Max,

Thanks for looking into this issue. I could reproduce it at home in the 
following way:

  $ git clean -fdx
  $ git checkout f90760fe0ed7317510bc6f44c5508e2072ed217d
  $ make raspberrypi_defconfig
  $ make |& tee log

It "chokes" when making as.info, during install-am.

Here is the log: http://pastebin.com/nsUjcZXf
And here is the .config: http://pastebin.com/cyuKb9yA

Best regards,

V.
