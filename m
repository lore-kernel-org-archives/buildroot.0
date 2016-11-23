From: daggs <daggs@gmx.com>
Date: Wed, 23 Nov 2016 19:14:29 +0100
Subject: [Buildroot] root passwd asked for reset every ssh login
In-Reply-To: <5e8a8f52-b8f3-7639-f091-5758d8b505c2@gmail.com>
References: <trinity-fb0422c9-2032-4095-bb6b-0656992b88fc-1479796384707@3capp-mailcom-bs04>,
 <5e8a8f52-b8f3-7639-f091-5758d8b505c2@gmail.com>
Message-ID: <trinity-386eead4-e60e-4722-835c-695b1cc785bb-1479924869646@3capp-mailcom-bs02>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Zoltan,

> Dear Dagg,
> 
> 
> you are using openssh in your image, right? The problem probably comes
> from the system time not properly set or not kept by an RTC on your
> target platform, which messes up openssh's file timestamp handling. In
> my experience in such a scenario (target system without RTC), it's
> easier to use dropbear as SSH server implementation, as it handles this
> differently. (Assuming of course that you don't need any specific
> feature of the OpenSSH implementation)
> 
> 
> Regards,
> 
> Zoltan Gyarmati

you are right, my arm board does not have any rtc, thanks for the help, I'll use dropbear.

Dagg.
