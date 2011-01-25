From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 25 Jan 2011 22:39:36 +0100
Subject: [Buildroot] [git commit master 1/1] Use sys-root rather than
	sysroot for the sysroot/staging_dir
In-Reply-To: <20110125150944.2C7438D244@busybox.osuosl.org>
References: <20110125150944.2C7438D244@busybox.osuosl.org>
Message-ID: <201101252239.36666.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Tuesday 25 January 2011 16:08:50 Peter Korsgaard wrote:
> The name of the sysroot directory is arbitrary, but as ct-ng uses sys-root,
> let's use that as well for consistency.

As Thomas said on IRC, I would suggest to revert this. Is there anything
in BR that depends on the sysroot being named 'sysroot' or 'sys-root' at all,
or was that just an eye-candy change? (genuine question)

I will push the change in crosstool-NG that makes this configurable, and
the default is now 'sysroot', instead of the old hard-coded 'sys-root'.

Then, it will be a matter of taste what to set it to, with BR forcing it
to whatever suits (I believe just 'sysroot').

Also, note that not all toolchains set this to any of 'sysroot' or 'sys-root'.
For example, the CodeSourcery toolchains set this to 'libc' for the main
sysroot, and to libc/${variant} for each supported variant's sysroot.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
