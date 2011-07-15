From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 15 Jul 2011 11:22:41 +0200
Subject: [Buildroot] linux: why is vmlinux only available for mips?
In-Reply-To: <CAAXf6LUUFNFF+xCQJX2juonZTXh8V1HBVqDRjjSJ1VMJXUyQFg@mail.gmail.com>
References: <CAAXf6LX2ApVsZ18tTuj4eqEYtAzKBHSXBMdhSJCPL+25YcJX8A@mail.gmail.com>
 <CAAXf6LUUFNFF+xCQJX2juonZTXh8V1HBVqDRjjSJ1VMJXUyQFg@mail.gmail.com>
Message-ID: <201107151122.41685.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Friday 15 July 2011 08:34:34 Thomas De Schampheleire wrote:
> If you stick with one kernel version, then you can hardcode it in the
> relevant scripts and Makefiles. However, when switching to another
> version, you have to update all of these files.
> One approach to solve all of this would be to create a symbolic link
> output/build/linux, pointing to the output/build/linux-X directory
> corresponding to the actually configured version.
> 
> What do you think of that?

Or you can use the BR2_LINUX_KERNEL_VERSION variable:
  output/build/linux-${BR2_LINUX_KERNEL_VERSION}/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
