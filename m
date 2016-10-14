From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Oct 2016 14:57:39 +0200
Subject: [Buildroot] [PATCH 2/2] jsoncpp: patch to include stdint.h,
	necessary for int64_t and uint64_t
In-Reply-To: <1474886662-46914-2-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 26 Sep 2016 11:44:22 +0100")
References: <1474886662-46914-1-git-send-email-Vincent.Riera@imgtec.com>
 <1474886662-46914-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87insv84vw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Otherwise failures like these one can happen during the configure phase
 > of other applications that use jsoncpp, like upmpdcli for instance:

 > checking jsoncpp/json/json.h usability... yes
 > checking jsoncpp/json/json.h presence... yes
 > checking for jsoncpp/json/json.h... yes
 > configure: error: libjsoncpp not found.

 > And this is the actual problem that you can see in config.log:

Thanks, but jsoncpp has already been bumped, and the new version
contains this fix:

commit e8d04791ff37be807995f6b7d242179756581343
Author: J?rg Krause <joerg.krause@embedded.rocks>
Date:   Tue Oct 11 21:09:30 2016 +0200

    package/jsoncpp: bump to version 1.7.7

    Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
