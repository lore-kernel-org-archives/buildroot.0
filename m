From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Aug 2015 23:26:05 +0200
Subject: [Buildroot] [PATCH] package/tn5250: fix static linking problem
In-Reply-To: <55DD9D29.6090308@imgtec.com> (Vicente Olivert Riera's message of
 "Wed, 26 Aug 2015 12:04:09 +0100")
References: <1440579591-23594-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150826090804.GG8919@tarshish> <55DD824B.6030700@imgtec.com>
 <20150826103248.GH8919@tarshish> <55DD9D29.6090308@imgtec.com>
Message-ID: <87lhcxwxle.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

Hi,

 > yeah, that one works. I was missing "libcrypto". But, I don't understand
 > why do you need to put libcrypto manually since it's already listed in
 > the openssl.pc file, and then libcrypto pulls libz. Doesn't work
 > recursively?

It should when linking statically. Make sure you pass --static to
pkg-conf (like we do in BR).

-- 
Bye, Peter Korsgaard
