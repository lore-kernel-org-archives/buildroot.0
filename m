From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 28 Sep 2014 13:51:25 +0200
Subject: [Buildroot] [PATCH] librtlsdr: disable shared library target
In-Reply-To: <20140924153333.2f56b768@free-electrons.com>
References: <1411561915-3225-1-git-send-email-yuvaraj.patil@wipro.com>
 <20140924153333.2f56b768@free-electrons.com>
Message-ID: <CAHXCMMJjZ3BmockfvRQaWJeccOG_+Zth=ewTK7WWQz-A_5HXyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yuvaraj, Thomas, all,

On Wed, Sep 24, 2014 at 3:33 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Yuvaraj Patil,
>
> On Wed, 24 Sep 2014 18:01:55 +0530, Yuvaraj Patil wrote:
>> Disable shared library target if BUILD_SHARES_LIBS is OFF.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/d68/d68a23e2a57fd5430d74b8151931f36959d9578d//
>>
>> Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
>> ---
>>  ...01_disable_shared_library_target_in_build.patch |   80 ++++++++++++++++++++
>>  1 file changed, 80 insertions(+)
>>  create mode 100644 package/librtlsdr/librtlsdr_001_disable_shared_library_target_in_build.patch
>
> Thanks, but we already have a patch fixing the same issue in our patch
> queue, see http://patchwork.ozlabs.org/patch/384567/. Apparently, the
> patch is causing some issues.
>
> Samuel, what is your plan regarding librtlsdr static link issue?

The patch added with this pathc is similar to the 2nd patch added in
http://patchwork.ozlabs.org/patch/384567/.

In http://patchwork.ozlabs.org/patch/384567/, the first patch is
causing some issue.
After checking the libusb dependencies, this first patch is not needed
in the context of Buildroot because when BR2_PREFER_STATIC_LIBS=y,
libusb won't depend on any library.

IMO, this patch can be merged as is, and
http://patchwork.ozlabs.org/patch/384567/ can be marked as superseded.


Regards,


-- 
Samuel
