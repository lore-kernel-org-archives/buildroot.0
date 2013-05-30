From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 30 May 2013 11:55:39 -0500
Subject: [Buildroot] [PATCH v9 05/14] webkit: bump to version 1.9.6
In-Reply-To: <20130530184530.7b6243b3@skate>
References: <1369931437-12445-1-git-send-email-spenser@gillilanding.com>
 <1369931437-12445-6-git-send-email-spenser@gillilanding.com>
 <20130530184530.7b6243b3@skate>
Message-ID: <CAEBucnB3G_GwGwssXWMa1DBSajWTzaU-QS=wvsJw-SPtFA=B-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 30, 2013 at 11:45 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Spenser Gilliland,
>
> On Thu, 30 May 2013 11:30:28 -0500, Spenser Gilliland wrote:
>>
>> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
>> ---
>>  package/webkit/webkit-bison-2-6-compat.patch       |  672 --------------------
>>  package/webkit/webkit-disable-docrebase.patch      |   21 +
>>  package/webkit/webkit-disable-tests.patch          |   76 +++
>>  package/webkit/webkit-execinfo_h.patch             |   24 +
>>  .../webkit-fix-build-issue-with-old-gtk.patch      |   22 -
>>  package/webkit/webkit-fix-build-with-gcc-4-6.patch |   45 --
>>  .../webkit-fix-compilation-on-DirectFB-2.patch     |   33 -
>>  .../webkit-fix-compilation-on-DirectFB.patch       |  144 -----
>>  package/webkit/webkit-fix-pool.patch               |   67 --
>>  package/webkit/webkit-pthread_getattr_np.patch     |   80 ---
>>  package/webkit/webkit.mk                           |   31 +-
>
> When so many patches are added/removed, it'd be good to have a short
> explanation in the commit log as to why such or such patch has been
> removed. Can be simply "drop webkit-fix-pool.patch" because it is
> upstream, or "drop webkit-fix-compilation-on-DirectFB-2.patch because
> we no longer support the DirectFB backend".

Fixed in newest revision. The following text was added to the commit message

    Remove bison-2.6-compat patch as it has been incorporated upstream.
    Remove fix build issue with old gtk as gtk has been bumped to a newer
    version.
    Remove fix-build-with-gcc-4-6 as it has incorporated upstream.
    Remove directfb patches due to depreciation
    Remove pool patch as it is no longer required
    Remove pthread_getattr_np as webkit no longer uses this function.

> Also, the new patches you had lack a header with description and
> Signed-off-by.

Fixed as well.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com



--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
