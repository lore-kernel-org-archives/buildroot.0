From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  5 Nov 2011 02:28:36 +0000 (UTC)
Subject: [Buildroot] [Bug 4454] There should be simple way to update image,
 when changing external fs skeleton
In-Reply-To: <bug-4454-163@https.bugs.busybox.net/>
References: <bug-4454-163@https.bugs.busybox.net/>
Message-ID: <20111105022836.4B5B98F460@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4454

--- Comment #1 from Danomi Mocelopolis <d_mo1234@yahoo.com> 2011-11-05 02:28:35 UTC ---
(In reply to comment #0)
> There should be simple way to update image, when changing external fs skeleton.
> 
> If you make changes in external fs skeleton, you don't need full OS rebuild,
> just some repacking. But there is no obvious way to do it.

On a few of our projects, we made added a "refresh" target that did:

- rm -fv $(BUILD_DIR)/.root $(BUILD_DIR)/*/.stamp_target_installed

- force the target skeleton copy done when making the "$(BUILD_DIR)/.root"
target
     + this copied all the skeleton files

- normal make
     + this re-installed everything ... in case a selected custom package
        installed a file on top of a default file living in the skeleton.

We used this feature quite often, since target skeleton was part of
what was updated from time to time as part of project development.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
