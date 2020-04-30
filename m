From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Apr 2020 14:39:26 +0200
Subject: [Buildroot] [PATCH 1/2] package/libid3tag: switch to debian to
 fix CVEs
In-Reply-To: <20200412101845.1013976-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 12 Apr 2020 12:18:44 +0200")
References: <20200412101845.1013976-1-fontaine.fabrice@gmail.com>
Message-ID: <87pnbp5erl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Upstream libid3tag is dead since 2004 so switch to debian to get two
 > patches that fix the following CVEs:
 >  - CVE-2004-2779: id3_utf16_deserialize() in utf16.c in libid3tag
 >    through 0.15.1b misparses ID3v2 tags encoded in UTF-16 with an odd
 >    number of bytes, triggering an endless loop allocating memory until
 >    an OOM condition is reached, leading to denial-of-service (DoS).
 >  - CVE-2017-11550: The id3_ucs4_length function in ucs4.c in libid3tag
 >    0.15.1b allows remote attackers to cause a denial of service (NULL
 >    Pointer Dereference and application crash) via a crafted mp3 file.
 >  - CVE-2017-11551: The id3_field_parse function in field.c in libid3tag
 >    0.15.1b allows remote attackers to cause a denial of service (OOM)
 >    via a crafted MP3 file.

 > Moreover, drop patch (replaced by add-m4-directory.patch debian patch)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
