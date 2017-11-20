From: Joel Stanley <joel@jms.id.au>
Date: Mon, 20 Nov 2017 22:23:30 +1030
Subject: [Buildroot] Github gcc-musl-5.4.0.tar.gz sha512 is wrong
Message-ID: <CACPK8XfyqWywqdevYW+HSij18Z8BJZmjWv=Ajs4O_nDtUYdodw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I saw this when building qemu_or1k_defconfig (buildroot
2017.11-rc2-19-gb4245aef53):

--2017-11-20 22:15:51--
https://github.com/openrisc/or1k-gcc/archive/musl-5.4.0/gcc-musl-5.4.0.tar.gz
Resolving github.com (github.com)... 192.30.255.113, 192.30.255.112
Connecting to github.com (github.com)|192.30.255.113|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/openrisc/or1k-gcc/tar.gz/musl-5.4.0
[following]
--2017-11-20 22:15:52--
https://codeload.github.com/openrisc/or1k-gcc/tar.gz/musl-5.4.0
Resolving codeload.github.com (codeload.github.com)... 192.30.255.121,
192.30.255.120
Connecting to codeload.github.com
(codeload.github.com)|192.30.255.121|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/x-gzip]
Saving to: 'buildroot-openrisc/output/build/.gcc-musl-5.4.0.tar.gz.xIdChC/output?

buildroot-op     [                      <=>              ] 107.35M
5.40MB/s    in 20s

2017-11-20 22:16:14 (5.46 MB/s) -
'buildroot-openrisc/output/build/.gcc-musl-5.4.0.tar.gz.xIdChC/output?
saved [112562068]

ERROR: gcc-musl-5.4.0.tar.gz has wrong sha512 hash:
ERROR: expected:
841101f7de45f327bf2e92f3efc73ca88a021e4b9b541458ce80a16e55882bd8606a8492d75c57c589ee2c10d42ae2865b67690155d7289a541df1d68096402f
ERROR: got     :
1ffbf4ec610b39107e4bb6224682aa6f49513f3fc96c137278b5d56db22db458f08b8b6e78c3940c00116b6e8e158410c1d337f666ec10cfdc4f0b6540b4b428

The download then fell back to the buildroot servers, which succeeded.

Cheers,

Joel
