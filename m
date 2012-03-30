From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Mar 2012 08:37:45 -0300
Subject: [Buildroot] [PATCH 5/7] psmisc: bump to version 22.16
In-Reply-To: <87fwcqe4ti.fsf@macbook.be.48ers.dk>
References: <1332987903-12378-1-git-send-email-gustavo@zacarias.com.ar>
 <1332987903-12378-5-git-send-email-gustavo@zacarias.com.ar>
 <87sjgrdq3g.fsf@macbook.be.48ers.dk>
 <90ff39765efa093002706980f59b4233@zacarias.com.ar>
 <87fwcqe4ti.fsf@macbook.be.48ers.dk>
Message-ID: <863cdef0cedcf207977015eeec5c8357@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-30 07:55, Peter Korsgaard wrote:

> It is true that we don't have SSP support in external toolchains, but
> BR2_TOOLCHAIN_BUILDROOT_USE_SSP isn't enabled for those, and for
> internal toolchains we do enable the SSP support in uClibc, so those
> should afaik be OK.
>
> So I think the commit is OK as is.

Shouldn't we push -fstack-protector into CFLAGS in the toolchain infra 
when the option is enabled?
AFAIK if you build stack protector support without using a form of 
-fstack-protector* in CFLAGS then the packages won't use it, right?
And if we leave it to each package to do it then we're just giving a 
false sense of security with that option.
On a side note, avahi is forcing stack protector off too since memorial 
times, maybe that should be revised?
Regards.
