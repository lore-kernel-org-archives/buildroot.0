From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 8 Jun 2016 16:19:02 +0200
Subject: [Buildroot] [PATCH v2] kmsxx: new package
In-Reply-To: <146541087.IVqEMkkuFm@avalon>
References: <1462783135-16131-1-git-send-email-maxime.ripard@free-electrons.com>
 <91587869.72Lxhe2Mek@avalon>
 <CAGm1_ksFR80bBVtQDE_wiQ4mvky311-iHzZjWKJegWz=u23Z+Q@mail.gmail.com>
 <146541087.IVqEMkkuFm@avalon>
Message-ID: <CAGm1_ksQWFgbVDdsJpnYV4F8cOJ9Prw5efUt0wbFNR6o41AxCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 8, 2016 at 4:16 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Hi Yegor,
>
> On Wednesday 08 Jun 2016 12:27:21 Yegor Yefremov wrote:
>> On Wed, Jun 8, 2016 at 12:18 PM, Laurent Pinchart wrote:
>> > On Wednesday 08 Jun 2016 12:11:10 Yegor Yefremov wrote:
>> >> On Thu, Jun 2, 2016 at 9:17 AM, Maxime Ripard wrote:
>> >>> On Mon, May 09, 2016 at 10:38:55AM +0200, Maxime Ripard wrote:
>> >>>> KMS++ is a suite of library and test tools to interact with KMS
>> >>>> drivers in the linux kernel.
>> >>>>
>> >>>> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>> >>>
>> >>> Ping?
>> >>
>> >> What about removing Python bindings config option and just check if
>> >> Python 3 is activated in *.mk file? See package/libcec/libcec.mk for
>> >> reference.
>> >>
>> >> Though libdrm already requires host-pkgconf, should this dependency
>> >> appear in kms.mk?
>> >>
>> >> I've looked at CMakeLIsts.txt in master branch of the project and I
>> >> cannot see swig invocation. They just seem to compile some cpp files
>> >> in py folder.
>> >
>> > The dependency on swig got removed recently, they now use pybind11.
>>
>> In other words we need https://pypi.python.org/pypi/pybind11 as a host
>> package?
>
> I don't think so, kmsxx includes pybind11 as a submodule.

I mean for the future. And if pybind11 would also supply pybin11.pc,
then CMake could even automatically find it.
