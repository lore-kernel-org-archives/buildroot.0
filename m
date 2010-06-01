From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Jun 2010 20:47:22 +0200
Subject: [Buildroot] [git commit master] Revert "Add -rpath option for
	host package compilation"
In-Reply-To: <20100601195204.6353fe94@surf> (Thomas Petazzoni's message of
	"Tue, 1 Jun 2010 19:52:04 +0200")
References: <20100530084318.C8A0EC03A6@busybox.osuosl.org>
	<20100601195204.6353fe94@surf>
Message-ID: <87pr0ar3np.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> find $(HOST_DIR)/bin $(HOST_DIR)/usr/bin $(HOST_DIR)/usr/sbin $(HOST_DIR)/sbin -type f -perm +111 -exec $(HOST_DIR)/usr/bin/patchelf --set-rpath $(HOST_DIR)/usr/lib {} \; >/dev/null 2>&1 || true

 Thomas> Would this sort of solution be acceptable ?

I wouldn't exactly call it pretty, but if we don't have any other
options ..

-- 
Bye, Peter Korsgaard
