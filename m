From: Guillaume Gardet <guillaume.gardet@free.fr>
Date: Mon, 12 Dec 2011 09:23:05 +0100
Subject: [Buildroot] Make problem on 64-bit linux with CS 2009q1
In-Reply-To: <CAHUNapRt1=nyUK=o__fUDk2JQVn66F1ikwBF+jarECg9=CESSg@mail.gmail.com>
References: <4EE1CB14.9010802@free.fr> <20111209193729.0cc88e6e@skate>
 <87y5ull8z0.fsf@macbook.be.48ers.dk> <87ty59l5y1.fsf@macbook.be.48ers.dk>
 <CAHUNapRt1=nyUK=o__fUDk2JQVn66F1ikwBF+jarECg9=CESSg@mail.gmail.com>
Message-ID: <4EE5B9E9.40404@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I finally found the problem. It comes from the file /usr/share/site/x86_64-unknown-linux-gnu which deals with lib64 and does not support arm.
A bug report with a patch has been submitted on openSUSE bugzilla :
https://bugzilla.novell.com/show_bug.cgi?id=736143

If needed, you can apply it on a running machine :
https://bugzillafiles.novell.org/attachment.cgi?id=466930

Regards,

Guillaume
