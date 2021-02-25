From: Ivo Grondman <buildroot@grondman.net>
Date: Thu, 25 Feb 2021 18:10:56 +0100
Subject: [Buildroot] Python package installed without dependencies
 defined in setup.py
In-Reply-To: <CAGm1_ksjakFD=iBx8RJRXtA9PeUOSFo_PQueytb2XsQm8XMRRw@mail.gmail.com>
References: <FF75D700-F93F-4299-9093-BED6912A3868@grondman.net>
 <CAGm1_ksjakFD=iBx8RJRXtA9PeUOSFo_PQueytb2XsQm8XMRRw@mail.gmail.com>
Message-ID: <EC9345B1-CC2D-4F0F-B2D8-7BE961B9F192@grondman.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

> On 25 Feb 2021, at 16:33, Yegor Yefremov <yegorslists@googlemail.com> wrote:
> 
> You'll have to manually add all required Python packages into your
> package's Config.in file. See package/python-flask/Config.in for the
> reference.

Thanks! It does seem a bit odd to me to have it in there, though, as:

1) It seems to defeat the purpose of using a setup.py file as that already has the necessary information on the Python package dependencies.
2) If the Python package dependencies of a custom Python package change, I have to make the changes in both the setup.py file (for the end user of the package in public use) and the Config.in (for myself in buildroot).

Wouldn?t it be possible (maybe not now, but in the future perhaps) to have buildroot setup a virtualenv for Python during the build in which it does the installation of all the Python packages and dependencies (using pip or something) and then just moves the complete Python tree into the target? I?m being a bit short here, but I hope you know what I mean :)

Any thoughts on this?

Cheers,

Ivo
