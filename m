From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Nov 2013 15:35:27 +0100
Subject: [Buildroot] Tool to check packages updates
In-Reply-To: <CACjG4BKXOp8oD1_j2ERCzn=ZUGj_G--Putxq0GrA4eHWG0VFwQ@mail.gmail.com>
References: <CACjG4BJq5TXvpMAoU7w3JgTVrOGHpeKng88HU03Rf_=XunPKAQ@mail.gmail.com>
 <CAAXf6LW1c32E_BFwbD6JKMCRKWtCw4r7pc9xuj3_DPsGyjL=SA@mail.gmail.com>
 <CACjG4B+7riHKmXG0Oo3cZxrWFygTBojSTHRktuYvz0eeMJ0ttQ@mail.gmail.com>
 <526809E4.30203@mind.be>
 <CACjG4BJtk-JxzUGmJn9urrMGMjkcwtmMxRys_FGrY761H1zQzA@mail.gmail.com>
 <CAAXf6LV9pBCwsqrtm6LJxiO1oaYX4afBv0tHPgOqVReV058GTA@mail.gmail.com>
 <CACjG4BJ0Qzv=GevE3rNHvc3n-YxOTg7FpWHmz1sAz4Q6+Q3wyg@mail.gmail.com>
 <CACjG4BKXOp8oD1_j2ERCzn=ZUGj_G--Putxq0GrA4eHWG0VFwQ@mail.gmail.com>
Message-ID: <20131108153527.0ef57df0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnaud,

On Fri, 8 Nov 2013 15:29:27 +0100, arnaud aujon wrote:

> Some news about the update checking script.
> The results are now : 839 packages (this is not the real package
> number because I don't check some of them), 294 are up-to-date, 323
> can be bumped and 222 unknown.
> You can find the script (check-updates.py) and the result (out.html)
> here : http://intelibre.fr/buildroot/

Thanks! Starts looking really interesting. I haven't had a look at the
script for now, only the results.

A few comments:

 * For util-linux, current version is 2.23.2, and your script believes
   2.23 is more recent.

 * For bash, current version is 4.2, and your script believes version
   3.2 is more recent.

 * There seems to be an issue with libjpeg version detection.

 * The latest version detected for aumix is 2, while it should be 2.9.1.

 * One funny case: the latest version detected for tstools is
   "WindowsXP" :-)

 * There are several more problematic cases, but I guess many of them
   have the same cause.

Also, it would be nice if you could order the list of packages
alphabetically.

Keep up the good work!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
