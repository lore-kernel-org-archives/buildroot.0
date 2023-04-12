Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE0DC7619A
	for <buildroot@archiver.kernel.org>; Wed, 12 Apr 2023 20:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E20C241F2D;
	Wed, 12 Apr 2023 20:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E20C241F2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pGQL7m6i4ehK; Wed, 12 Apr 2023 20:00:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E34D41F0C;
	Wed, 12 Apr 2023 20:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E34D41F0C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 931901C3D13
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 20:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5E6141E09
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 20:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5E6141E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LQRKnMDKSwJo for <buildroot@lists.busybox.net>;
 Wed, 12 Apr 2023 20:00:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D32941DFF
 for <buildroot@uclibc.org>; Wed, 12 Apr 2023 20:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D32941DFF
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 80C74819D6; Wed, 12 Apr 2023 20:00:09 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 12 Apr 2023 20:00:09 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2020.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lgadallah@impinj.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15541-163-p7xsqgO66o@https.bugs.busybox.net/>
In-Reply-To: <bug-15541-163@https.bugs.busybox.net/>
References: <bug-15541-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15541] support/downloads/git generates deceptive
 archive of Linux repo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=15541

--- Comment #1 from Larry Gadallah <lgadallah@impinj.com> ---
Adding a 'set -x' at the top and a 'git log -1' at the bottom of
support/download/git yields the following, showing the issue explicitly:

>>> linux 0af534041cba4c33e540f6b31b73ce78f8326757 Downloading
+ . /mnt/work/buildroot/support/download/helpers
+ myname=/mnt/work/buildroot/support/download/git
+ OPTS=("${@}")
+ declare -a OPTS
+ verbose=
+ recurse=0
+ getopts :hc:d:o:n:N:H:ru:qf:e OPT
+ case "${OPT}" in
+ cset=0af534041cba4c33e540f6b31b73ce78f8326757
+ getopts :hc:d:o:n:N:H:ru:qf:e OPT
+ case "${OPT}" in
+ dl_dir=/mnt/home/dl/linux
+ getopts :hc:d:o:n:N:H:ru:qf:e OPT
+ case "${OPT}" in
+ basename=linux-0af534041cba4c33e540f6b31b73ce78f8326757
+ getopts :hc:d:o:n:N:H:ru:qf:e OPT
+ case "${OPT}" in
+ getopts :hc:d:o:n:N:H:ru:qf:e OPT
+ case "${OPT}" in
+ getopts :hc:d:o:n:N:H:ru:qf:e OPT
+ case "${OPT}" in
+ uri=git@github.com:impinj-octane/linux-kernel.git
+ getopts :hc:d:o:n:N:H:ru:qf:e OPT
+ case "${OPT}" in
+
output=/mnt/work/output/r515_octane/build/.linux-0af534041cba4c33e540f6b31b73ce78f8326757-br1.tar.gz.47D9n9/output
+ getopts :hc:d:o:n:N:H:ru:qf:e OPT
+ shift 15
+ git_cache=/mnt/home/dl/linux/git
+ mkdir -p /mnt/home/dl/linux/git
+ pushd /mnt/home/dl/linux/git
+ trap _on_error ERR
+ cat
+ _git init .
+ eval GIT_DIR=/mnt/home/dl/linux/git/.git git init .
++ GIT_DIR=/mnt/home/dl/linux/git/.git
++ git init .
Initialized empty Git repository in /mnt/home/dl/linux/git/.git/
+ _git remote
+ eval GIT_DIR=/mnt/home/dl/linux/git/.git git remote
++ GIT_DIR=/mnt/home/dl/linux/git/.git
++ git remote
+ grep -q -E '^origin$'
+ _git remote add origin
''\''git@github.com:impinj-octane/linux-kernel.git'\'''
+ eval GIT_DIR=/mnt/home/dl/linux/git/.git git remote add origin
''\''git@github.com:impinj-octane/linux-kernel.git'\'''
++ GIT_DIR=/mnt/home/dl/linux/git/.git
++ git remote add origin git@github.com:impinj-octane/linux-kernel.git
+ _git remote set-url origin
''\''git@github.com:impinj-octane/linux-kernel.git'\'''
+ eval GIT_DIR=/mnt/home/dl/linux/git/.git git remote set-url origin
''\''git@github.com:impinj-octane/linux-kernel.git'\'''
++ GIT_DIR=/mnt/home/dl/linux/git/.git
++ git remote set-url origin git@github.com:impinj-octane/linux-kernel.git
+ printf 'Fetching all references\n'
Fetching all references
+ _git fetch origin
+ eval GIT_DIR=/mnt/home/dl/linux/git/.git git fetch origin
++ GIT_DIR=/mnt/home/dl/linux/git/.git
++ git fetch origin
Warning: Permanently added 'github.com,192.30.255.113' (ECDSA) to the list of
known hosts.
remote: Enumerating objects: 8074633, done.
remote: Counting objects: 100% (65368/65368), done.
remote: Compressing objects: 100% (26591/26591), done.
remote: Total 8074633 (delta 44871), reused 50448 (delta 38657), pack-reused
8009265
Receiving objects: 100% (8074633/8074633), 1.52 GiB | 8.98 MiB/s, done.
Resolving deltas: 100% (6789454/6789454), done.
From github.com:impinj-octane/linux-kernel
 * [new branch]                PI-23091-new-kernel     ->
origin/PI-23091-new-kernel
. . .
 * [new tag]                   v4.16.8                 -> v4.16.8
+ _git fetch origin -t
+ eval GIT_DIR=/mnt/home/dl/linux/git/.git git fetch origin -t
++ GIT_DIR=/mnt/home/dl/linux/git/.git
++ git fetch origin -t
Warning: Permanently added the ECDSA host key for IP address '192.30.255.112'
to the list of known hosts.
+ _git fetch origin
''\''0af534041cba4c33e540f6b31b73ce78f8326757:0af534041cba4c33e540f6b31b73ce78f8326757'\'''
+ _git rev-parse --quiet --verify
''\''0af534041cba4c33e540f6b31b73ce78f8326757^{commit}'\'''
+ cmd='printf "Deregistering submodule \"%s\"\n" "${path}" && cd .. && rm -rf
"${path##*/}"'
+ _git submodule --quiet foreach ''\''printf "Deregistering submodule \"%s\"\n"
"${path}" && cd .. && rm -rf "${path##*/}"'\'''
+ eval GIT_DIR=/mnt/home/dl/linux/git/.git git submodule --quiet foreach
''\''printf "Deregistering submodule \"%s\"\n" "${path}" && cd .. && rm -rf
"${path##*/}"'\'''
++ GIT_DIR=/mnt/home/dl/linux/git/.git
++ git submodule --quiet foreach 'printf "Deregistering submodule \"%s\"\n"
"${path}" && cd .. && rm -rf "${path##*/}"'
+ _git checkout -f -q ''\''0af534041cba4c33e540f6b31b73ce78f8326757'\'''
+ eval GIT_DIR=/mnt/home/dl/linux/git/.git git checkout -f -q
''\''0af534041cba4c33e540f6b31b73ce78f8326757'\'''
++ GIT_DIR=/mnt/home/dl/linux/git/.git
++ git checkout -f -q 0af534041cba4c33e540f6b31b73ce78f8326757
warning: refname '0af534041cba4c33e540f6b31b73ce78f8326757' is ambiguous.
Git normally never creates a ref that ends with 40 hex characters
because it will be ignored when you just specify 40-hex. These refs
may be created by mistake. For example,

  git switch -c $br $(git rev-parse ...)

where "$br" is somehow empty and a 40-hex ref is created. Please
examine these refs and maybe delete them. Turn this message off by
running "git config advice.objectNameWarning false"
+ _git clean -ffdx
+ eval GIT_DIR=/mnt/home/dl/linux/git/.git git clean -ffdx
++ GIT_DIR=/mnt/home/dl/linux/git/.git
++ git clean -ffdx
++ _git log -1 --pretty=format:%ci
++ eval GIT_DIR=/mnt/home/dl/linux/git/.git git log -1 --pretty=format:%ci
+++ GIT_DIR=/mnt/home/dl/linux/git/.git
+++ git log -1 --pretty=format:%ci
+ date='2022-12-16 15:50:20 +0000'
+ '[' 0 -eq 1 ']'
+ popd
+ git log -1
commit 80165e2cb123947637819792b6401e4b5bd96286 (HEAD)
Author: Lee Gillham <lgillham@impinj.com>
Date:   Fri Mar 3 16:12:08 2023 -0800

    rshell: Correctly report ProductionFused status

    - The ICTL library uses the script /usr/sbin/sb_status.sh and compares
      the output with "production", the buffer was too small. Increased size
      of the buffer to 11 (from 9) characters, so production + NULL would
      fit.

    PI-33597
+ mk_tar_gz /mnt/home/dl/linux/git
linux-0af534041cba4c33e540f6b31b73ce78f8326757 '2022-12-16 15:50:20 +0000'
/mnt/work/output/r515_octane/build/.linux-0af534041cba4c33e540f6b31b73ce78f8326757-br1.tar.gz.47D9n9/output
'.git/*'
+ local in_dir=/mnt/home/dl/linux/git
+ local base_dir=linux-0af534041cba4c33e540f6b31b73ce78f8326757
+ local 'date=2022-12-16 15:50:20 +0000'
+ local
out=/mnt/work/output/r515_octane/build/.linux-0af534041cba4c33e540f6b31b73ce78f8326757-br1.tar.gz.47D9n9/output
+ shift 4
+ local glob tmp pax_options
+ local -a find_opts
+ for glob in "$@"
+ find_opts+=(-or -path "./${glob#./}")
++ date -d '2022-12-16 15:50:20 +0000' -u +%Y-%m-%dT%H:%M:%S+00:00
+ date=2022-12-16T15:50:20+00:00
+ pax_options=delete=atime,delete=ctime,delete=mtime
+
pax_options+=',exthdr.name=%d/PaxHeaders/%f,exthdr.mtime={2022-12-16T15:50:20+00:00}'
+++ pwd
++ mktemp
--tmpdir=/mnt/work/output/r515_octane/build/.linux-0af534041cba4c33e540f6b31b73ce78f8326757-br1.tar.gz.47D9n9
+
tmp=/mnt/work/output/r515_octane/build/.linux-0af534041cba4c33e540f6b31b73ce78f8326757-br1.tar.gz.47D9n9/tmp.9pbn9R4HDp
+ pushd /mnt/home/dl/linux/git
+ find . -not -type d -and -not '(' -false -or -path './.git/*' ')'
+ LC_ALL=C
+ sort
+ tar cf -
'--transform=s#^\./#linux-0af534041cba4c33e540f6b31b73ce78f8326757/#S'
--numeric-owner --owner=0 --group=0 --mtime=2022-12-16T15:50:20+00:00
--format=posix
'--pax-option=delete=atime,delete=ctime,delete=mtime,exthdr.name=%d/PaxHeaders/%f,exthdr.mtime={2022-12-16T15:50:20+00:00}'
-T
/mnt/work/output/r515_octane/build/.linux-0af534041cba4c33e540f6b31b73ce78f8326757-br1.tar.gz.47D9n9/tmp.9pbn9R4HDp.sorted
+ gzip -6 -n
+ rm -f
/mnt/work/output/r515_octane/build/.linux-0af534041cba4c33e540f6b31b73ce78f8326757-br1.tar.gz.47D9n9/tmp.9pbn9R4HDp.list
/mnt/work/output/r515_octane/build/.linux-0af534041cba4c33e540f6b31b73ce78f8326757-br1.tar.gz.47D9n9/tmp.9pbn9R4HDp.sorted
/mnt/work/output/r515_octane/build/.linux-0af534041cba4c33e540f6b31b73ce78f8326757-br1.tar.gz.47D9n9/tmp.9pbn9R4HDp.tar
+ popd
>>> linux 0af534041cba4c33e540f6b31b73ce78f8326757 Extracting
gzip -d -c
/mnt/home/dl/linux/linux-0af534041cba4c33e540f6b31b73ce78f8326757-br1.tar.gz |
tar --strip-components=1 -C
/mnt/work/output/r515_octane/build/linux-0af534041cba4c33e540f6b31b73ce78f8326757
  -xf -


Note that the file created,
/mnt/home/dl/linux/linux-0af534041cba4c33e540f6b31b73ce78f8326757-br1.tar.gz
has a name that implies that it is associated with commit ID
0af534041cba4c33e540f6b31b73ce78f8326757 but the commit of the repo that was
archived is actually 80165e2cb123947637819792b6401e4b5bd96286 as shown by the
'git log -1' output.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
