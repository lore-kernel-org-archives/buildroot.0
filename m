From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 02 Dec 2015 22:49:06 +0000
Subject: [Buildroot] [Bug 8066] nodejs crashes when built with gcc 4.9
In-Reply-To: <bug-8066-163@https.bugs.busybox.net/>
References: <bug-8066-163@https.bugs.busybox.net/>
Message-ID: <bug-8066-163-6pHeVx7aby@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8066

Martin <martin@barkynet.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at buildroot.uclibc |martin at barkynet.com
                   |.org                        |

--- Comment #7 from Martin <martin@barkynet.com> ---
(In reply to Dr I J Ormshaw from comment #5)
> I've re-created the issue and attached the good and bad config files, I've
> also attaches the differences between the two, as a patch.
> 
> The version of buildroot I am using is
> 
> 2015.02
> 6bf057b0f2ba188397a691f74877a4a30aaea3f9
> 
> The console output for the failure is:
> 
> 
> [root at buildroot ~]# node
> traps: node[194] general protection ip:736725 sp:7ffc3c721350 error:0 in
> node[400000+73c000]
> Segmentation fault

I've not managed to reproduce your issue.  Your config files contains various
customisations like an override file, kernel patches, overlay etc so I'm not
able to full replicate your setup.

Instead I used buildroot version 2015.11 and the qemu_x86_64_defconfig as a
start point.  I configured for a core i7, gcc 4.9.3, glibc and node.js v0.10.40
and node works fine in qemu.  I even tried eglibc as you do (which is now
deprecated) and it worked fine too.

I can only suggest you try to upgrade to buildroot 2015.11 and test again,
perhaps your issue has been fixed.  If you still find the issue then can you
please attach a minimal non-working Buildroot configuration, removing any
custom override files and packages which are not needed to reproduce the issue.

Thanks

Martin

-- 
You are receiving this mail because:
You are on the CC list for the bug.
