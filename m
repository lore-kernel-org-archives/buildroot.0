From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Jun 2020 22:18:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/mp4v2: security bump to version
 4.1.3
In-Reply-To: <20200515211327.15078-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 15 May 2020 23:13:27 +0200")
References: <20200515211327.15078-1-fontaine.fabrice@gmail.com>
Message-ID: <87o8q2fsk0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Switch site to an active fork
 > - Send patch upstream
 > - Update indentation in hash file (two spaces)
 > - Fix the following CVEs:
 >   - CVE-2018-14054: A double free exists in the MP4StringProperty class
 >     in mp4property.cpp in MP4v2 2.0.0. A dangling pointer is freed again
 >     in the destructor once an exception is triggered.
 >     Fixed by
 >     https://github.com/TechSmith/mp4v2/commit/f09cceeee5bd7f783fd31f10e8b3c440ccf4c743
 >   - CVE-2018-14325: In MP4v2 2.0.0, there is an integer underflow (with
 >     resultant memory corruption) when parsing MP4Atom in mp4atom.cpp.
 >     Fixed by
 >     https://github.com/TechSmith/mp4v2/commit/e475013c6ef78093055a02b0d035eda0f9f01451
 >   - CVE-2018-14326: In MP4v2 2.0.0, there is an integer overflow (with
 >     resultant memory corruption) when resizing MP4Array for the ftyp
 >     atom in mp4array.h.
 >     Fixed by
 >     https://github.com/TechSmith/mp4v2/commit/70d823ccd8e2d7d0ed9e62fb7e8983d21e6acbeb
 >   - CVE-2018-14379: MP4Atom::factory in mp4atom.cpp in MP4v2 2.0.0
 >     incorrectly uses the MP4ItemAtom data type in a certain case where
 >     MP4DataAtom is required, which allows remote attackers to cause a
 >     denial of service (memory corruption) or possibly have unspecified
 >     other impact via a crafted MP4 file, because access to the data
 >     structure has different expectations about layout as a result of
 >     this type confusion.
 >     Fixed by
 >     https://github.com/TechSmith/mp4v2/commit/73f38b4296aeb38617fa3923018bb78671c3b833
 >   - CVE-2018-14403: MP4NameFirstMatches in mp4util.cpp in MP4v2 2.0.0
 >     mishandles substrings of atom names, leading to use of an
 >     inappropriate data type for associated atoms. The resulting type
 >     confusion can cause out-of-bounds memory access.
 >     Fixed by
 >     https://github.com/TechSmith/mp4v2/commit/51cb6b36f6c8edf9f195d5858eac9ba18b334a16

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
