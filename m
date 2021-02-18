From: Ivo Grondman <buildroot@grondman.net>
Date: Thu, 18 Feb 2021 18:37:28 +0100
Subject: [Buildroot] Forcing a Python package to be built/installed with
 Python3
In-Reply-To: <0e304f3a-63b8-ee8d-ab38-7a089b0be2d4@xes-inc.com>
References: <66577029-8BDB-43C9-97E3-45442AE23E6B@grondman.net>
 <0e304f3a-63b8-ee8d-ab38-7a089b0be2d4@xes-inc.com>
Message-ID: <378D518D-BBCD-4E57-B718-C5030A48FEF2@grondman.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> On 18 Feb 2021, at 18:31, Vincent Fazio <vfazio@xes-inc.com> wrote:
> 
>> Using Buildroot 2020.11.2 in a Vagrant VM based on the Vagrantfile supplied by Buildroot, I?m testing my own Python package (setuptools based) with utils/test-pkg, but even though my Config.in clearly mentions the dependency on Python3 (as suggested by the docs), the tests fail and looking at the logs I can see that it?s using Python 2.7. Everything does work when I don?t have Python2 installed, but I want to make sure that even if it *is* installed, it will not be used for the build/install of this package.
> Do you mean installed on the host machine? Do you have a shebang in a file that may be referencing a host path like /usr/bin/python or /usr/bin/env python and it's symlinked to python2.7 vs python3?

I simply downloaded the Vagrantfile from Buildbox and ran ?vagrant up? and did my builds from there. In the VM, /usr/bin/python was indeed symlinked to 2.7, but even after changing that symlink to point to 3.6 (which is the version also installed on the VM) it will still use 2.7.

Cheers,

Ivo
