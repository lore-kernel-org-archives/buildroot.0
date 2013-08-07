From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 7 Aug 2013 10:11:19 -0400
Subject: [Buildroot] [PATCH] infra: display current task as title of the
 term window
In-Reply-To: <CAAXf6LX2OxYtyY_-uJ7C1kwVyDeYNMjJt8L0-BKNmRdis=MzaQ@mail.gmail.com>
References: <1375822004-22591-1-git-send-email-francois.perrad@gadz.org>
 <CAAXf6LWCBh-W3nHRLtoXVy8PfbS3NpOQ7sMwicp6W+kv-OeAkg@mail.gmail.com>
 <CAB0FRsssGoXoq7+Ft=Cku0jexY=c1wBf-p4XK2v=F8RyDRH8Mw@mail.gmail.com>
 <CAAXf6LX2OxYtyY_-uJ7C1kwVyDeYNMjJt8L0-BKNmRdis=MzaQ@mail.gmail.com>
Message-ID: <CANxTyt4TEFGJ_mW3PnqnTb_Z=+YRQEn=hyHUbxC79GBrYpTJgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 7, 2013 at 5:11 AM, Thomas De Schampheleire <
patrickdepinguin+buildroot@gmail.com> wrote:

> On Wed, Aug 7, 2013 at 10:45 AM, Fran?ois Perrad
> <francois.perrad@gadz.org> wrote:
> > Thomas,
> >
> > at the end of the command, the initial title is restored, so try
> > something like :
> > $ echo -e "\033]2;Foo\007" && wait
> >
>
> This also doesn't change anything for me.


For what it's worth - It didn't appear to do anything on my Ubuntu 12.04 -
because the "wait" ended immediately.  But if I replace the "wait" with a
"sleep", then the window title persists for the entire sleep time.  So, for
example, this worked for me:

echo -e "\033]2;Buildroot menuconfig\007" && make menuconfig

(But only if I hadn't set a Title already from the window's drop-down menu.)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130807/ab729d77/attachment.html>
