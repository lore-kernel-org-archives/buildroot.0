From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Jul 2021 23:18:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: fix build with ICU 69
In-Reply-To: <20210719100352.3541635-1-james.hilliard1@gmail.com>
References: <20210719100352.3541635-1-james.hilliard1@gmail.com>
Message-ID: <20210719231841.7f1e1053@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 19 Jul 2021 04:03:52 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Fixes:
> ../deps/v8/src/objects/js-list-format.cc: In static member function ?static v8::internal::MaybeHandle<v8::internal::JSListFormat> v8::internal::JSListFormat::New(v8::internal::Isolate*, v8::internal::Handle<v8::internal::Map>, v8::internal::Handle<v8::internal::Object>, v8::internal::Handle<v8::internal::Object>)?:
> ../deps/v8/src/objects/js-list-format.cc:173:67: error: ?static icu::ListFormatter* icu::ListFormatter::createInstance(const icu::Locale&, const char*, UErrorCode&)? is private within this context
>   173 |       icu_locale, GetIcuStyleString(style_enum, type_enum), status);
>       |                                                                   ^
> In file included from ../deps/v8/src/objects/js-list-format.cc:25:
> /home/buildroot/buildroot/output/per-package/host-icu/host/include/unicode/listformatter.h:267:27: note: declared private here
>   267 |     static ListFormatter* createInstance(const Locale& locale, const char* style, UErrorCode& errorCode);
>       |                           ^~~~~~~~~~~~~~
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../nodejs/0002-Fix-build-with-ICU-68.patch   | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 package/nodejs/0002-Fix-build-with-ICU-68.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
