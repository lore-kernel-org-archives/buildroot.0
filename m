From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Feb 2013 21:46:15 +0100
Subject: [Buildroot] [PATCH] libsndfile: Add dependency on BR2_LARGEFILE
In-Reply-To: <1360083605-10855-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 5 Feb 2013 18:00:05 +0100")
References: <1360083605-10855-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mwvio5ew.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Ryan Mallon <rmallon@gmail.com>
 Thomas> libsndfile requires sizeof(sf_count_t) == 8, where sf_count_t is a
 Thomas> typedef alias for off_t. This is not true by default for all
 Thomas> tool-chains, which leads to a runtime assert failure in binaries
 Thomas> compiled against libsndfile. See:

 Thomas>   http://permalink.gmane.org/gmane.comp.audio.libsndfile.devel/229

 Thomas> Add a dependency on BR2_LARGEFILE for libsndfile, and a comment if
 Thomas> BR2_LARGEFILE is not selected.

 Thomas> [Thomas: rebased patch, added more propagation of the new
 Thomas> BR2_LARGEFILE dependency to gst-plugins-good and mpd.]

Committed, thanks.

-- 
Bye, Peter Korsgaard
