From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Nov 2013 18:29:17 +0100
Subject: [Buildroot] Autobuilder site back online
In-Reply-To: <20131116223632.462c6e60@skate>
References: <20131116223632.462c6e60@skate>
Message-ID: <20131117172917.GB4425@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-11-16 22:36 +0100, Thomas Petazzoni spake thusly:
[--SNIP--]
> Therefore, I have migrated the service to a dedicated server that I
> own. I have direct access to the support team, I can reboot the server,
> access the logs. And this server has more disk space (1 TB) and is much
> more powerful than the previous one.
> 
> This new service is temporarily available at:
> 
> 	http://autobuild.humanoidz.org

Here are a few analysis of some of the build failures:

http://autobuild.humanoidz.org/results/a60/a60a63163288af14f701adfdfa9f62229c983984/
  -> unable to download the toolchain from mentor.com
  -> I was able to download the toolchain OK from here
  -> temporary glitch in network or on the server?

http://autobuild.humanoidz.org/results/889/889b3870c30d027af1aedb843648c4ddb7ed79f0/
  -> Cannot execute cross-compiler '/path/to/toolchain/usr/bin/microblaze-linux-gcc'

http://autobuild.humanoidz.org/results/33f/33ff18fef818bba47eedaff2662142c25b53b4da/
  -> Cannot execute cross-compiler '/path/to/toolchain/usr/bin/aarch64-linux-gcc'

http://autobuild.humanoidz.org/results/6aa/6aa47858a511e89b0bd6a3a472276baab65afb1c/
  -> Cannot execute cross-compiler '/path/to/toolchain/usr/bin/nios2-linux-gcc'

For the last three failures above, can it be that the .config file is
improperly tweaked by the test framework?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
