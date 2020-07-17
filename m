From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jul 2020 14:51:39 +0200
Subject: [Buildroot] [PATCH 1/4] package/mender-artifact: bump version
 to 3.4.0
In-Reply-To: <20200715173707.584226-1-aduskett@gmail.com>
References: <20200715173707.584226-1-aduskett@gmail.com>
Message-ID: <20200717145139.50b3254a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jul 2020 10:37:04 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Update the following license file hashes due to copyright year changes:
>   - vendor/github.com/mendersoftware/mendertesting/LICENSE
>   - vendor/github.com/davecgh/go-spew/LICENSE
>   - vendor/github.com/stretchr/testify/LICENSE
> 
> Add hashes for the the following new files:
>   - vendor/github.com/minio/sha256-simd/LICENSE
>   - vendor/gopkg.in/yaml.v2/LICENSE
>   - vendor/github.com/klauspost/compress/LICENSE
>   - vendor/github.com/russross/blackfriday/v2/LICENSE.txt
>   - vendor/github.com/klauspost/pgzip/LICENSE
>   - vendor/github.com/cpuguy83/go-md2man/v2/LICENSE.md
>   - vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

I don't know if this is exactly related to this version bump, but after
this, I'm seeing my autobuilder fails to remove the output directory,
with lots of:

rm: cannot remove '/home/test/autobuild/run/instance-2/output-1/build/host-mender-artifact-3.4.0/_gopath/pkg/mod/github.com/klauspost/compress at v1.10.5/zip/testdata/utf8-osx.zip': Permission denied

This is due to the fact that the folders created in
/home/test/autobuild/run/instance-2/output-1/build/host-mender-artifact-3.4.0/_gopath/pkg/mod/github.com/klauspost/
don't have write permission:

test at build:~/autobuild/run/instance-2/output-1/build/host-mender-artifact-3.4.0/_gopath/pkg/mod/github.com/klauspost$ ls -l
total 8
dr-x------ 12 test test 4096 Jul 17 05:15 compress at v1.10.5
dr-x------  3 test test 4096 Jul 17 05:15 pgzip at v1.2.3

is this expected ? Is there anything we can do to have proper
permissions on this ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
