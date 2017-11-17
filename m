From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Nov 2017 11:33:06 +0100
Subject: [Buildroot] [PATCH] systemd: set time epoch for reproducible
 builds
In-Reply-To: <20171117105550.0c95e622@windsurf.lan> (Thomas Petazzoni's
 message of "Fri, 17 Nov 2017 10:55:50 +0100")
References: <20171116170316.19081-1-john@metanate.com>
 <20171117105550.0c95e622@windsurf.lan>
Message-ID: <87d14h9ov1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

> $ stat -c %Y NEWS 
 > 1499868070

 > $ date -d @1499868070 +%Y-%m-%d 
 > 2017-07-12

 > So I'm not sure why your patch would be necessary. Could you check
 > what's going on?

Exactly my thought as well. Tar should restore the modification time. If
you use OVERRIDE_SRCDIR things may naturally be different though, I'm
not sure git/rsync handles that correct.

-- 
Bye, Peter Korsgaard
