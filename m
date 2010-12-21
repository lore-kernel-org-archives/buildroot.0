From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 21 Dec 2010 14:20:30 +0100
Subject: [Buildroot] [PATCH 1/1] xlib_libX11: compile makekeys for the
	host correctly
In-Reply-To: <90d05a2a9ac9123d0fab7f68c31d58feb627d16a.1292937286.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Tue, 21 Dec 2010 14:14:53 +0100")
References: <cover.1292937286.git.thomas.petazzoni@free-electrons.com>
	<cover.1292937286.git.thomas.petazzoni@free-electrons.com>
	<90d05a2a9ac9123d0fab7f68c31d58feb627d16a.1292937286.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87r5dbuush.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> As reported by Miroslav Ignjatovic in bug #2983, our hack in
 Thomas> xlib_libX11 to build makekeys for the host does not work, for several
 Thomas> reasons:

 Thomas>  * As we are building a tool for the host, we shouldn't pass
 Thomas>    -I$(STAGING_DIR)/usr/include, since the $(STAGING_DIR) contains
 Thomas>    headers of packages for the target.

 Thomas>  * Instead, we should use the headers in $(HOST_DIR)/usr/include. They
 Thomas>    were not used due to a type: $(HOST_CFLAGS) must be used instead of
 Thomas>    $(HOSTCFLAGS).

s/type/typo/

Committed, thanks.

-- 
Bye, Peter Korsgaard
