From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 9 Oct 2013 09:23:22 +0200
Subject: [Buildroot] legal-info: multiple licenses separator
Message-ID: <CAAXf6LXusXB0QSG_EHOv8VpcEY+mpuUeW-pvnXtWNUrFfb_0Kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca, all,

FOO_LICENSE_FILES is a space-separated list according to the manual,
and the code correctly reflects this.
The manual does not specify whether FOO_LICENSE is space-separated or
comma-separated, and the code has a mix of both. I think we should
clarify this and line up everything with the decision.

I believe the comma provides more clarity for complex licenses like
FOO_LICENSE = GPLv2+, GPLv2 (py-smbus)
I believe it is more clear here that GPLv2 applies to py-smbus, and
GPLv2+ to all the rest.

However, the comma conflicts with the comma separator of the CSV
manifest. This looks like:
"foo","1.2","GPLv2+, GPLv2 (py-smbus)","COPYING"
while the quotes probably make standard CSV imports work correctly,
basic command-line tools like cut won't because it would also split on
the intermediate comma. With awk you can split on "," and manually
remove the leading and trailing " on the line, but it's a bit more
complex.

I think that if we accept the comma in FOO_LICENSE, we should replace
the separator in the manifest with something else, for example a
semicolon ; which would not typically appear in any of the other
fields.

Thanks for your input,
Thomas
