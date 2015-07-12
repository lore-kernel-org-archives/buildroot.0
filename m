From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 12 Jul 2015 15:30:34 +0200
Subject: [Buildroot] [PATCH 1/7] Add <PKG>_STRIP_COMPONENTS for packages
 with non-standard tarballs
In-Reply-To: <20150712134448.759340d5@free-electrons.com>
References: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
 <20150712134448.759340d5@free-electrons.com>
Message-ID: <55A26BFA.10607@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Sat, 11 Jul 2015 16:15:04 +0200, Luca Ceresoli wrote:
>> Usually package tarballs contain only a directory named
>> "<pkg-name>-<pkg-version>" which contains the actual source tree. To properly
>> extract the source files in $(BUILD_DIR), Buildroot passes the
>> --strip-components=1 option to tar.
>>
>> Unfortunately a few packages ship in a non-standard way, with no root
>> directory or with more than one. In Buildroot these packages must be handled by
>> overriding the <PKG>_DOWNLOAD_CMDS.
>>
>> As the number of such packages is growing, introduce a <PKG>_STRIP_COMPONENTS
>> variable for packages to request a number of components to strip different
>> from 1.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Cc: Arnout Vandecappelle <arnout@mind.be>
>> ---
>>   package/pkg-generic.mk | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> This actually triggered a failure in the build of the tar package:
>
>     http://autobuild.buildroot.org/results/ae2/ae20df67f99f75b1ba5d5b7316ad265d66f3aa66/build-end.log
>
> We have already fixed it, it was quite interesting:
>
>     http://git.buildroot.net/buildroot/commit/?id=ef7cc99c7a432aa3929015183f7c7476b7cd1b68

Ouch. O:-)

Thanks for fixing it so quickly!

-- 
Luca
