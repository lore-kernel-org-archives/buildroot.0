From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Apr 2018 18:49:42 +0200
Subject: [Buildroot] Per-package download folders and Git caching
In-Reply-To: <20180403162324.GB2335@scaer> (Yann E. MORIN's message of "Tue, 3
 Apr 2018 18:23:24 +0200")
References: <20180403141703.21cd24fe@windsurf>
 <041a5a2a-3f9d-c76e-4c6d-d22ef11cad43@mind.be>
 <876058qvi4.fsf@dell.be.48ers.dk> <20180403162324.GB2335@scaer>
Message-ID: <87k1top74p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

>> >  I know a few users that put their download directory on a samba share or a
 >> > virtualbox/vmware share which has NTFS as underlying filesystem. Although NTFS
 >> > does support hardlinks, I'm not sure that Samba and virtualbox/vmware do. Any
 >> > idea what will happen in such a case?
 >> 
 >> Then presumably the ln call will fail and we download the tarball again
 >> in the new location?

 > No, the script would fail, because the script runs with 'set -e'.

Ahh yes :/

 > Should we do a cp if ln fails, then?

That sounds like a sensible fallback, yes.

-- 
Bye, Peter Korsgaard
