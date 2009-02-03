From: Steve Calfee <nospamcalfee@yahoo.com>
Date: Tue, 3 Feb 2009 11:35:40 -0800 (PST)
Subject: [Buildroot] 2009.02-rc3 released
In-Reply-To: <87skmyirxq.fsf@macbook.be.48ers.dk>
Message-ID: <388709.89503.qm@web58208.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Good job. First time in years I could download a buildroot and get it to build.

So now I thought why not try and see if it runs. I built all the defaults, so I ended up with a 686 target. Fine, that is what I have on as my host. 

Googling around I found mention of running the image as a vmware bootable disk. Good I have vmware installed. However now I get stuck.

The scripts directory has a build-ext3-img script with tantalizing hints it might build what I need. It also appears it needs to be run as root? Trying sudo in ubuntu did not work. However, the script has no docs and it is talking in some kind of code :) It talks about the path to the image - what is that the output file path? Then the name of the image again - the output of the script? And then an enigmatic message "echo "Enter the path and filename for the root filesystem"
echo "tarball that you want to install into the image"" I don't see any applicable .tar type file.


First somewhere in the docs there should be a description of the disk layout for buildroot. From my buildroot dir:

binaries - a couple directories in there is an intriguingly named file "rootfs.i686.ext2" Would that be echo "Enter the path and filename for the root filesystem"
echo "tarball that you want to install into the image"
from the build-ext3-img script?


dl - documented       

package - looks like every known package that can be configured and built?

scripts - ok dir name is clear, script usage is not 

toolchain - not clear but probably build tool sources?

build_i686 - Not clear what it holds?

docs - Nice html docs      

project - my project make/config stuff?            

target - unclear, more my project specific build stuff?

toolchain_build_i686 - looks like where the toolchain got built too. Where do the binaries go? /bin only has sed?

project_build_i686 - appears to be where my project is built, but under uclibc there are 3 mysterious directories autotools-stamps  buildroot-config  busybox-1.13.2. But then there is an intriguing directory called root. Is this an NFS mountable point for my target?

Anyway, my confusion getting started cannot be totally unique. I appreciate any help I can get.

Steve


      
