From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Mon, 16 Sep 2019 13:01:15 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/libcamera: link with atomic when needed
In-Reply-To: <CAPi7W82uy0JqWjcrY95QhvrCvakrMTL7oiY=p_tgZ0CWrZe-8g@mail.gmail.com>
References: <20190905165306.2178-1-fontaine.fabrice@gmail.com>
 <20190915221830.162023bb@windsurf.home>
 <8f55b843-24a1-d5d2-851e-05cce44bcb08@ideasonboard.com>
 <CAPi7W813-84mSmENffGqJqbQ2c+HamFORvQvvxeyJtqH1zSDXg@mail.gmail.com>
 <05f7a3f5-38ac-e165-5183-fbbb305eef23@ideasonboard.com>
 <CAPi7W82uy0JqWjcrY95QhvrCvakrMTL7oiY=p_tgZ0CWrZe-8g@mail.gmail.com>
Message-ID: <6861a786-8657-6033-e171-c93183cfce32@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On 16/09/2019 12:54, Fabrice Fontaine wrote:
> Le lun. 16 sept. 2019 ? 13:40, Kieran Bingham
> <kieran.bingham@ideasonboard.com> a ?crit :
>>
>> Hi Fabrice,

<snip>

>> Is there a clean way to mark libcamera as not supported on /really/ old
>> toolchains?
> From my understanding, there is no clean way to check for the
> availability of O_TMPFILE.
> However, O_TMPFILE is only used by tests and tests can be disabled
> through -Dtest=false.

You're right. Disabling tests was renamed from -Dtests=false to
-Dtest=false.

The buildroot package was already disabling tests through -Dtests=false,
so if we fix this up - then the tests will no longer be built again, and
we won't have any issue with O_TMPFILE ...

Problem (well two problems) solved :-D

Thanks I should have remembered to fix up the -Dtests issue when I knew
it was being changed!

Do you want to update the buildroot package and bump the version?
or shall I do it?
-- 
Regards
--
Kieran
