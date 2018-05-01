From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 1 May 2018 10:36:20 -0500
Subject: [Buildroot] [PATCH 4/4] package/Makefile.in: Use gcc spec files
 for PIE build flags
In-Reply-To: <CANQCQpZPtJrZgTv2xOuOEJG9EhWik6=qd0v7sDhHR+r6zni3bw@mail.gmail.com>
References: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
 <20180425064518.31797-4-stefan.sorensen@spectralink.com>
 <CANQCQpZPtJrZgTv2xOuOEJG9EhWik6=qd0v7sDhHR+r6zni3bw@mail.gmail.com>
Message-ID: <CANQCQpYyKZzycQX-zfG4r_4aoAd-VjO0ie4cMk6Gp4-djLP-xA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan,

On Tue, May 1, 2018 at 10:13 AM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Stefan,
>
> On Wed, Apr 25, 2018 at 1:45 AM, Stefan S?rensen
> <stefan.sorensen@spectralink.com> wrote:
>> The PIE build flags are only intended for building executables and can not be
>> used in relocateable links (-r), static builds and shared library build -
>> including the flags here causes build errors.
>>
>> So instead of parsing the PIE flags directly on the command line to gcc,
>> include them in a gcc spec file where it is possible to only apply the flags
>> when other incompatible flags are not set.
>>
>> This method and the spec files are from the Fedora build system.
>>
>> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
>
> Thank you for this approach, I had a patchset reworking packages to
> deal with cases of "-r", static and shared.  This eliminates that and
> makes a wrapper approach much easier as the next step.
>
> Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>

Just realized when I was cleaning things up this one needs rework with
the drop of patch 3.  Here's a v2 of this patch.
http://patchwork.ozlabs.org/patch/907093/
