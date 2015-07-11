From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 13:09:14 +0200
Subject: [Buildroot] [PATCH v4 2015.08 1/4] pkg-generic: add
 step_pkg_size global instrumentation hook
In-Reply-To: <55A0F41E.10900@openwide.fr>
References: <1432591007-27689-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1432591007-27689-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <55A0F41E.10900@openwide.fr>
Message-ID: <20150711130914.40d5622e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 11 Jul 2015 12:46:54 +0200, Romain Naour wrote:

> > This commit also adds a Config.in option to enable the collection of
> > this data, as calculating the md5 of all installed files at the
> > beginning and end of the installation of each package can be
> > considered a time-consuming process which maybe some users will not be
> > willing to suffer from.
> 
> The part for Config.in is not in this patch, I seems that you dropped it wile
> reworking this series. So the size-stat option can't be disabled actually.

It's actually the commit log that is incorrect: removing the option is
intentional. From the cover letter:

 - Remove the BR2_COLLECT_FILE_SIZE_STATS option, and collect the
   necessary data unconditionally. This was suggested by Yann
   E. Morin, who did some testing of the performance impact, and found
   that it was so insignificant that it is negligible. See Yann's
   analysis at
   http://lists.busybox.net/pipermail/buildroot/2015-February/119431.html.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
