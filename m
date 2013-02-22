From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Feb 2013 09:44:03 -0300
Subject: [Buildroot] [PATCH] Revert "uClibc: port linuxthreads
 errnopatch to 0.9.33.2"
In-Reply-To: <CFB67F3F72BB450DAF0C0E10C27DFC00@JohanW7>
References: <1361455787-4846-1-git-send-email-gustavo@zacarias.com.ar>
 <877gm1hhsm.fsf@dell.be.48ers.dk> <CFB67F3F72BB450DAF0C0E10C27DFC00@JohanW7>
Message-ID: <51276813.7050604@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/22/2013 09:39 AM, Sagaert Johan wrote:

> Hi
> 
> I saw this patch was reverted, so I wonder is there (already or in the making) a way so I can point to a directory in the buildroot
> configuration where I have additional ?Clibc patches and a 'series' file ? (similar like the infrastructure for the kernel patches.)
> Annoying problem anyway, my app fails at runtime without the patch.
> 
> Johan

Hi.
Out of curiosity why don't you want to use NPTL with the latest uClibc?
If i remember correctly using anything other than NPTL is not recommended.
You could use a trick similar to
toolchain/gcc/*/powerpc-link-with-math-lib.patch.conditional for this
patch but in a reverse fashion (the gcc patch is applied for powerpc
only, you could apply for everything except sparc, though you'd had to
check if it's the only affected arch - it's a build issue so it
shouldn't be difficult).
The patch conditions are set in toolchain/gcc/gcc-uclibc-4.x.mk
Since the patch fixes issues i don't think Peter would disagree in
applying it.
Regards.
