From: John Voltz <john.voltz@gmail.com>
Date: Tue, 25 Mar 2008 15:18:01 -0400
Subject: [Buildroot] Linking Cups with dbus broken
In-Reply-To: <47E93B5A.6060805@st.com>
References: <47E93B5A.6060805@st.com>
Message-ID: <46a136670803251218u2b5c669m1a550dc54b89c98b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CUPS shouldn't be getting selected by X, it is a dependency for the gtk
printing backend. But anyway, I don't know if the latest cups version even
supports the latest dbus. Unless you need some new feature of dbus, I would
just roll the dbus version back. If you are using gtk, there is probably a
way to disable the print backend so cups isn't required.

John Voltz

On Tue, Mar 25, 2008 at 1:50 PM, Christian SCHWARZ <christian.schwarz@st.com>
wrote:

> The linking of Cups with dbus does not work (any more). ARM11 target
> with March 17th snapshot, dbus is 1.1.1 :
>
> ------------------------snip---------------------------------
> subscriptions.o: In function `cupsd_send_dbus':
> buildroot/build_arm/cups-1.3.5/scheduler/subscriptions.c:1334: undefined
> reference to `dbus_message_append_iter_init'
> buildroot/build_arm/cups-1.3.5/scheduler/subscriptions.c:1336: undefined
> reference to `dbus_message_iter_append_string'
> buildroot/build_arm/cups-1.3.5/scheduler/subscriptions.c:1339: undefined
> reference to `dbus_message_iter_append_uint32'
> buildroot/build_arm/cups-1.3.5/scheduler/subscriptions.c:1340: undefined
> reference to `dbus_message_iter_append_string'
> -------------------------snap--------------------------------
>
> The linker correctly finds the dbus libraries, but a grep/objdump
> confirmed that the symbols are not in the dbus libraries. Might need to
> bump the version?
>
> CUPS is automatically selected when building X, is that really necessary?
>
> cheers,
> Christian
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080325/44883936/attachment.htm 
