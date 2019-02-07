From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 Feb 2019 22:47:40 +0100
Subject: [Buildroot] [PATCH] core/pkg-infra: restore completeness of
 packages files lists
In-Reply-To: <CAAXf6LXhHQZGK_py7hou1LbYw=cpYA_tp-ZBk1PrDE2U0KaRqQ@mail.gmail.com>
 (Thomas De Schampheleire's message of "Wed, 6 Feb 2019 21:12:01
 +0100")
References: <20190206143751.5814-1-yann.morin.1998@free.fr>
 <CAAXf6LXhHQZGK_py7hou1LbYw=cpYA_tp-ZBk1PrDE2U0KaRqQ@mail.gmail.com>
Message-ID: <874l9f1dab.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 > Observations:

 > 1. The call to 'comm' should also happen with LC_ALL=C or comm may
 > complain that a file is not sorted. This is noticed in tzdata, where
 > there are two files differing only in a '+' and '-' sign in their
 > name. Depending on the locale, the sort order is different:

Correct.

 > 2. This is more an observation than a change-request: the directories
 > where a package installs files, e.g. usr/bin, usr/lib, ... are
 > attributed for that package. This means that 'usr/lib' is for example
 > attributed to each and every library.
 > In a way I like this, because it means that with the output for one
 > package you have both all files and all directories that it touches,
 > regardless of who created the directory first.
 > But it should be checked whether other users of the output can cope
 > with it, like graph-size.

Yes, I noticed as well that Yann dropped the -type f argument to find. I
think the easiest/safest is just to add that back.

-- 
Bye, Peter Korsgaard
