From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 14 Sep 2010 14:20:07 +0000 (UTC)
Subject: [Buildroot] gdb and external toolchain
References: <4C8E2777.7030202@carallon.com>
	<AANLkTimDzh0kHMk2fjBqMzW8r5r3EAk==q+A7QsH6S9L@mail.gmail.com>
	<4C8F7ADB.6070601@carallon.com>
Message-ID: <i6o0an$7it$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-09-14, William Wagner <will_wagner@carallon.com> wrote:

[...]
> http://sourceware.org/gdb/wiki/FAQ
>
> It says that gdb needs un stripped libpthread and libthread_db
> libraries to work. I'm not sure if this is on the target with
> gdbserver or on the host running gdb.

The latter.  I've never had any issues debugging stripped libraries 
and binaries on the target.

> Currently buildroot strips the libraries on the target.

That should work fine.

> I've never had a problem debugging with an internal buildroot
> toolchain so presumably buildroot is correct in stripping the
> libraries on the target.

Yes.

> Has anyone seen this before and able to point me in the right
> direction?

The only two things I know about are making sure the libraries are
built with debugging symbols, and then making sure gdb can find them
(by setting the solib-absolute-prefix option in gdb).

-- 
Grant Edwards               grant.b.edwards        Yow! I have seen these EGG
                                  at               EXTENDERS in my Supermarket
                              gmail.com            ... I have read the
                                                   INSTRUCTIONS ...
