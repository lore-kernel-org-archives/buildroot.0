From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 27 Oct 2020 08:32:39 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-10-25
In-Reply-To: <b56105e96c0bfb86b803acc2ef6e0aad@tudorholton.com>
References: <b56105e96c0bfb86b803acc2ef6e0aad@tudorholton.com>
Message-ID: <CANQCQpaurhRXOqqe34dO6Kzw77_JpjQLFb=F2SMcYGC625ZO8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tudor,

On Mon, Oct 26, 2020 at 4:08 AM Tudor Holton <tudor@tudorholton.com> wrote:
>
> Hi all,
>
> The CVE listed below appears only to relate to openjdk6 and openjdk7.
> The current package builds openjdk11.0.8 or openjdk14.0.2.
>

The vulnerability database must not be mapping the impacted versions
correctly (ie.  CVE is applicable to which CPE or range of CPE
versions).   When I look at
https://nvd.nist.gov/vuln/detail/CVE-2013-0169 , I see specific
entries for 1.6 / 1.7 / 1.8 and an entry of
cpe:2.3:a:oracle:openjdk:-:*:*:*:*:*:*:* .  I wonder if we are
incorrectly string matching that "-" as a version?  +Gregory  any
ideas?

Tudor, you can definitely send a patch to ignore this CVE but I
believe we may have a matching issue with our scripts. As the
following are the listed CPE matches which according to the CVE text
look correct.
cpe:2.3:a:oracle:openjdk:-:*:*:*:*:*:*:*
cpe:2.3:a:oracle:openjdk:1.6.0:*:*:*:*:*:*:*
cpe:2.3:a:oracle:openjdk:1.7.0:*:*:*:*:*:*:*
cpe:2.3:a:oracle:openjdk:1.8.0:*:*:*:*:*:*:*

Best Regards,
Matt
