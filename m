From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 13 Aug 2014 12:27:49 -0400
Subject: [Buildroot] [PATCH 1/1] qt: make installation of translation
 files optional
In-Reply-To: <53EB6F3C.7060302@lucaceresoli.net>
References: <1406948936-1962-1-git-send-email-danomimanchego123@gmail.com>
 <53EB6F3C.7060302@lucaceresoli.net>
Message-ID: <CANxTyt6AdrrBD0NaHFomi5Q+OkDAZREGhCOx6RNa8qbF1gtc+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca,

On Wed, Aug 13, 2014 at 9:59 AM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Dear Danomi, Vivien,
>
> [Copying Vivien as the author of commit 93917b6980f7, which originated
> the issue.]
>
> I have a comment on this patch, even though it has already been
> committed.
>
>
> Danomi Manchego wrote:
>>
>> Commit 93917b6980f7f2b51302e1a3fa451b07cf7d674e introduced the
>> installation of the binary .qm translation files, unconditionally.
>> This patch introduces an option to disable this behavior, saving
>> almost 8MB of space.
>>
>> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>>
>> ---
>>
>> Note: the new option is defaulted to "y", to match the current qt.mk
>> operation.
>
>
> I'm not sure this is a good default value.
> Surely it preserves backward compatibility with Buildroot versions since
> 2013.11, when the installation got introduced. But for years the
> translation files were never installed, and apparently it was not a
> problem to anybody.

I am in total agreement.  In fact, this default of 'y' is *never* good
for my projects, as we make our own translation files.  For our local
customized version of buildroot, I comment out the default of 'y', to
generally discourage its use, and to preserve the *old* behavior
(since we only recently updated to buildroot-2014.05, from a 2013.xx).
My main goal was to get the ability to remove the translation files
into the upstream buildroot, so that my local customization is less
significant (now just the default setting mod in Config.in, rather
than the switch itself and the .mk file mod).

The only reason I defaulted it to 'y' was to make the patch
uncontroversial, to increase the chances of patch acceptance.


> The size is very large for some embedded systems. I have Qt-based
> systems working since years and never needed them. I have one that is
> around 17 MB, becomes 25 MB with translations!
>
> Danomi, Vivien, can you explain exactly what these translations are and
> when they are needed?

Try reading about Qt Linuguist, at
http://qt-project.org/doc/qt-4.8/linguist-manual.html .
Basically, the Linquist tools extract text tokens, and provide a
framework for substituting language translations.


> Unless there is a good reason to have the translations on most targets
> I would change the default to no in order to preserve new users from an
> unnoticed extra size that might be unneeded.
>
> If you agree, I'd send a patch to change this.

Sounds good to me!

Danomi -


> Thanks.
> --
> Luca
