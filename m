From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Apr 2018 12:44:52 +0200
Subject: [Buildroot] [PATCHv3] core/download fix local backend
In-Reply-To: <20180404162239.22682-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Wed, 4 Apr 2018 18:22:39 +0200")
References: <20180404162239.22682-1-yann.morin.1998@free.fr>
Message-ID: <87d0zclil7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Since c8ef0c03b0b (download: put most of the infra in dl-wrapper), the
 > backend for local files is now named after the scheme, which is 'file'
 > for a local file.

 > From the same commit on, the directory part and the basename are now
 > passed separately, to let the backend reconstruct the full path when it
 > needs to do so, which is the case for the 'file' backend too.

 > Finaly, ff559846fdc1 (support/download: Add support to pass options
 > directly to downloaders) introduced a nasty error, as it made use of
 > "${@}" when calling its internal function. Revert that mess now...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

 > ---
 > Changes v2 -> v3:
 >   - drop spurious "${@}"

 > Changes v1 -> v2:
 >   - really fix it now: filename passed as other option

Committed, thanks.

-- 
Bye, Peter Korsgaard
