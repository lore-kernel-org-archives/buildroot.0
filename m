From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Mon, 13 Apr 2015 12:31:16 +0200
Subject: [Buildroot] [PATCH v3 1/3] doxygen: new package
In-Reply-To: <20150412185549.32b96003@free-electrons.com>
References: <1428659399-28620-1-git-send-email-bgolaszewski@baylibre.com>
 <1428659399-28620-2-git-send-email-bgolaszewski@baylibre.com>
 <20150412185549.32b96003@free-electrons.com>
Message-ID: <CAMpxmJX9uHBxcPe=Co+L7Gk2fpKvT=Q8gy0LexUJmNVXgatOkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-04-12 18:55 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Bartosz Golaszewski,
>
> On Fri, 10 Apr 2015 11:49:57 +0200, Bartosz Golaszewski wrote:
>> Host package only.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>>  package/doxygen/doxygen.hash |  2 ++
>>  package/doxygen/doxygen.mk   | 28 ++++++++++++++++++++++++++++
>>  2 files changed, 30 insertions(+)
>>  create mode 100644 package/doxygen/doxygen.hash
>>  create mode 100644 package/doxygen/doxygen.mk
>
> I've applied, but I had to do some further changes, because it was
> still not building properly:
>
>     [Thomas:
>      - add missing dependencies on host-flex and host-bison
>      - add $(HOST_MAKE_ENV) to the configure, build and install steps, to
>        make sure that the doxygen build system can find flex and bison.]
>
> You don't catch such issues because you build on a development system
> that has lots of development tools already installed, while the
> autobuilders are testing using minimal chroots having only the strictly
> required Buildroot dependencies installed.

I'll have to start testing buildroot patches in a minimal chrooted
environment then. Thanks for the hint.

Best regards,
Bartosz Golaszewski
