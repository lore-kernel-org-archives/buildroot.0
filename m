From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 Sep 2013 21:57:55 +0200
Subject: [Buildroot] Do if-post-up.d and if-pre-down.d belong in the
	device table?
In-Reply-To: <CANxTyt6qrfH6ZbVEpJoAJjK50MYhvhez+prXB9LNzZR7ZqgVvg@mail.gmail.com>
 (Danomi Manchego's message of "Sat, 31 Aug 2013 13:59:13 -0400")
References: <CANxTyt6qrfH6ZbVEpJoAJjK50MYhvhez+prXB9LNzZR7ZqgVvg@mail.gmail.com>
Message-ID: <87r4czxf0c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

Hi,

 Danomi> Peter, Gustavo,
 Danomi> I was looking into some if-up/down stuff, and stumbled on this commit that
 Danomi> added if-post-up.d and if-pre-down.d to the device_table.txt:

It would be good if you had sent this mail also to Gustavo's and my
email addresses, to ensure it didn't get missed.

 Danomi> http://lists.busybox.net/pipermail/buildroot/2012-April/053214.html

 Danomi> But in actuality, busybox does not execute scripts from those places. ?Rather,
 Danomi> the busybox change was to treat "post-up" and "pre-down" key words as aliases
 Danomi> for "up" and "down", just like the full-blown ifupdown-0.6.16. ?I.e., if you
 Danomi> search for the underlying "execute_all" operations in either busybox-1.21.0/
 Danomi> networking/ifupdown.c or in the upstream ifupdown, you will see that only
 Danomi> "pre-up", "up", "down, and "post-down" directory contents are executed, and
 Danomi> that "up" scripts are invoked after the up action has occurred, and the "down"
 Danomi> scripts are run before the down action has occurred - giving them the roles of
 Danomi> "post-up" and "pre-down".

 Danomi> I think having the extra two directories in the device table might mislead
 Danomi> people into thinking that scripts there will be executed. ?Or have I
 Danomi> misunderstood something? ?For sure, it's not executing scripts from those
 Danomi> places with busybox-1.21.1 ...

 Danomi> FYI, the busybox commit that added the "post-up" and "pre-down" support can be
 Danomi> reviewed at:

 Danomi> http://lists.busybox.net/pipermail/busybox-cvs/2012-April/033401.html

It looks like you're right. Gustavo?

-- 
Bye, Peter Korsgaard
