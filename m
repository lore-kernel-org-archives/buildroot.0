From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 4 Jul 2017 17:00:51 +0200
Subject: [Buildroot] [PATCH v4 03/11] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <cdaecbe8-57a3-6435-d797-a03e952e5caf@grandegger.com>
References: <1498559207-8050-1-git-send-email-wg@grandegger.com>
 <1498559207-8050-4-git-send-email-wg@grandegger.com>
 <8aa491de-1a71-0a8e-3274-4512ec22f763@mind.be>
 <cf95d170-797e-c9c9-cf68-575e7e3a19a3@grandegger.com>
 <ca4ed8a9-8ffe-5d03-718a-5661a1d8a527@mind.be>
 <cdaecbe8-57a3-6435-d797-a03e952e5caf@grandegger.com>
Message-ID: <CAHXCMMLjyUDTo1Y9D2jTeyzcK-C8YaT95mYDnHRwu5t28JRF6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wolfgang

On Tue, Jul 4, 2017 at 4:52 PM, Wolfgang Grandegger <wg@grandegger.com> wrote:
[...]

> Just playing with it. Here are some quick results:
>
>   if patchelf --print-rpath "${file}" > /dev/null 2>&1; then
>
>   35.5 sec
>
>   if readelf -d "${file}" 2>/dev/null | grep RPATH > /dev/null; then
>
>   30.4 sec
>
>   if readelf -d "${file}" > /dev/null 2>&1 -a \
>      patchelf --print-rpath "${file}" > /dev/null 2>&1; then

hmm... I think you should do: s/-a/&&/
AFAIK, `-a' is only valid with `test' or '`[ some-expression -a
some-other-expression ]', `&&' should be used to combine the result of
several commands.

Regards,

>
>   27.7 sec
>
> There is some saving but maybe not worth the effort for the moment.
> Concentrating on the next release now.
>
> Wolfgang.
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Samuel
