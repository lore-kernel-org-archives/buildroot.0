From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 06 Apr 2020 20:18:09 +0300
Subject: [Buildroot] [PATCH v4] package/cog: add option for platform DRM.
In-Reply-To: <092c5373232c820c5b730ff21d737b333c3f5dd2.camel@igalia.com>
References: <20200312194700.2836-1-cturner@igalia.com>
 <20200402113455.4391-1-cturner@igalia.com>
 <20200404234630.712aca1d@windsurf.home> <20200405014959.GD324638@momiji>
 <092c5373232c820c5b730ff21d737b333c3f5dd2.camel@igalia.com>
Message-ID: <87o8s4edny.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

On Mon, Apr 06 2020, Charles Turner wrote:
> Hello,
>
> Thank you for your reviews.
>
> I have commented below. As an aside, I note my patch has been removed
> from the Patchwork interface[1]. My process so far was to find it
> there, copy the message ID, and continue the version bumps. However,
> now that I can't find it there, and that this has become a patch
> *series*, I will be sending new mails.

Your patch is still there:

  http://patchwork.ozlabs.org/patch/1265532/

It state has changed to "Changes Requested" so it does not appear in the
default view. You can remove the "State = Action Required" filter to see
your patch listed. You can also search patches by submitter:

  http://patchwork.ozlabs.org/project/buildroot/list/?submitter=76614&series=&q=&delegate=&archive=&state=*

You can also do all that from command line using the pwclient utility:

  http://patchwork.ozlabs.org/pwclient/

baruch

> On Sun, 2020-04-05 at 01:49 +0300, Adrian Perez de Castro wrote:
>> Hello,
>> 
>> I am adding a few comments to Thomas' questions below.
>> 
>> On Sat, 4 Apr 2020 23:46:30 +0200, Thomas Petazzoni <
>> thomas.petazzoni at bootlin.com> wrote:
>>  
>> > On Thu,  2 Apr 2020 12:34:55 +0100
>> > Charlie Turner <cturner@igalia.com> wrote:
>> > 
>> > > diff --git a/package/cog/Config.in b/package/cog/Config.in
>> > > index b25991d4ae..6a7c5668a5 100644
>> > > --- a/package/cog/Config.in
>> > > +++ b/package/cog/Config.in
>> > > @@ -7,7 +7,9 @@ config BR2_PACKAGE_COG
>> > >  	depends on BR2_PACKAGE_WPEWEBKIT
>> > >  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
>> > >  	depends on BR2_USE_MMU # dbus
>> > > +
>> > 
>> > Why this new empty line?
>
> It was visually pleasing at the time, sorry for introducing an
> inconsistency, I should have checked.
>
>> > Why are you dropping the wayland and wayland-protocols
>> > dependencies?
>> > Overall, it makes sense because cog does not depends/select wayland
>> > or
>> > wayland-protocols. Ditto for wpebackend-fdo.
>> 
>> We need those, but only when BR2_PACKAGE_COG_PLATFORM_FDO is enabled.
>
> I slightly diverted here, wayland is needed for both FDO and DRM (FDO
> is a client and DRM is a server). Only FDO registers new protocols, so
> that is platform-specific.
>
> Best,
> 	Charlie.
>
> [1] https://patchwork.ozlabs.org/project/buildroot/list/
>

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
