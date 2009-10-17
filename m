From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 17 Oct 2009 22:06:40 +0000 (UTC)
Subject: [Buildroot] [Bug 665] [PATCH] Samba package
In-Reply-To: <bug-665-163@https.bugs.busybox.net/>
References: <bug-665-163@https.bugs.busybox.net/>
Message-ID: <20091017220641.040F977726@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=665





--- Comment #2 from rvpaasen <rvpaasen@t3i.nl>  2009-10-17 22:06:40 UTC ---

I created the patch with 'git diff package/samba'. Could you try using 'patch'?
Here patching succeeds:

mmnet at Wodan:[buildroot]:~/broot/buildroot.git$ rm -rf package/samba
mmnet at Wodan:[buildroot]:~/broot/buildroot.git$ git pull
Already up-to-date.
mmnet at Wodan:[buildroot]:~/broot/buildroot.git$ git checkout package/samba
mmnet at Wodan:[buildroot]:~/broot/buildroot.git$ ls package/samba/
Config.in  samba-add-check-for-__use_bsd.patch     samba-fix-client-mtab.patch 
samba-getgrouplist.patch  samba-remove-legacy-index.patch
S91smb     samba-do-not-check-glibc-version.patch  samba-fix-mount.cifs.patch  
samba.mk                  simple.conf
mmnet at Wodan:[buildroot]:~/broot/buildroot.git$ patch -p1 <
../buildroot-samba.patch 
patching file package/samba/Config.in
patching file package/samba/samba.mk
mmnet@Wodan:[buildroot]:~/broot/buildroot.git$ 


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
