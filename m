From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 May 2019 14:23:17 +0200
Subject: [Buildroot] Reg: Stripped binaries in output/build
In-Reply-To: <CAAMHf5HyYJD=sxodMWfkQCkbg0ne5OEwfP9QG7cHFsrEK6M_jg@mail.gmail.com>
References: <CAAMHf5HyYJD=sxodMWfkQCkbg0ne5OEwfP9QG7cHFsrEK6M_jg@mail.gmail.com>
Message-ID: <fb97ce02-cdd3-f706-2533-c4174328f58c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/04/2019 15:15, ravi chandran wrote:
> Hi,
> ? I am using buildroot version 2019.02. By default i could see all the binaries
> in output/target are stripped versions.? Similarly is there an option exist to
> generate stripped binaries in output/build folder . The intention here is to
> reduce the size of the output/build folder.

 There is no such option. Stripping binaries in the build directory would take a
long time and have very little impact on the overall size.

 If the size of the build folder is really an issue for you, you can do

rm -rf output/build/*/*

 That way, you can *sometimes* still do a rebuild, though there is a significant
risk that something will fail when you try to rebuild. So you could just as well
save output/images and throw away the entire output directory.

 Regards,
 Arnout
