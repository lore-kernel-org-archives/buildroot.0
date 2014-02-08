From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  8 Feb 2014 22:04:07 +0000 (UTC)
Subject: [Buildroot] [Bug 4339] Allow override of DL_DIR in extract step
In-Reply-To: <bug-4339-163@https.bugs.busybox.net/>
References: <bug-4339-163@https.bugs.busybox.net/>
Message-ID: <20140208220407.558FC9C8FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4339

--- Comment #2 from Danomi Mocelopolis <d_mo1234@yahoo.com> 2014-02-08 22:04:07 UTC ---
(In reply to comment #1)
> Can you provide more details as to what you are trying to achieve, and how?

We have internally developed proprietary packages that we maintain and release,
as versioned tarballs.  We keep the tarballs themselves in source control, in
their own directory.  The idea being that we have one DL_DIR with opensource
code that could be freely given to anyone who wanted it, and a separate DL_DIR
for internal stuff that stays proprietary.


> If you are simply setting DL_DIR from the .mk file of an individual package,
> this won't work as expected because all subsequent packages will now have that
> DL_DIR too (non-recursive make).

Actually, we do something like this in the .mk files of our internal packages:

$($(PKG)_BUILD_DIR)/.stamp_% : DL_DIR=$(OUR_SPECIAL_DL_DIR)

We've been doing this since 2011, and it has worked quite well - proprietary
packages get pulled from one directory, opensource comes from / gets downloaded
to another directory.  The only penalty to us is that we have to add an extra
"$" in the $(2)_EXTRACT_CMDS definition, as per the patch.

This bug can be closed, really - this request is perhaps too specific to our
use of buildroot.  Besides, this was a change request, not really a bug - I was
new to the buildroot community in 2011, and thought that the change process was
driven by bugzilla rather than submitting patches to the mailing list.  (The
documentation on the BR website has improved tremendously since then, so I
wouldn't make that mistake today.)

Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
