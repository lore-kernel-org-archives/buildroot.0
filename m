Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F1BC25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 05:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50E9482F57;
	Wed, 17 Aug 2022 05:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50E9482F57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AsZfwy5QIrRc; Wed, 17 Aug 2022 05:56:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D74682EB5;
	Wed, 17 Aug 2022 05:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D74682EB5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32B5D1BF947
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 05:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A44940AD9
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 05:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A44940AD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RpbTawSW2rog for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 05:56:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33D6E4013F
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33D6E4013F
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 05:56:49 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id u133so11215239pfc.10
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 22:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=jcnI/nyWoZvvDUnd9zXg6xWZo8QElRiXt27Va/aufek=;
 b=zFymeuvcpNs3hwHeYdNtbLcLENtWxEvOhuuBUftkBSt090IVS5cwaj+AX7N0F4mvVR
 WZ+5WTWRBvjPx4VOGN0zO3NYCOCm2YBgozLKa4wtNJATB7TwMi3FcPpLJ8o6auwKihgq
 yggZy9Oumefg0qjN4XcCBgWrHUkqzS+QdMOks1P5rd5Yv+vs41QfKi54qKeM/1h8OeCr
 t+6C6P7ypJRWmRqqfkrzExZRf08XkzehgcgfocU0NvtVEG0hjnucMVQa0l0S6JJxkcUO
 w9i25wxJQdU0U4Qc4JM1ZgLiP8FCEFivyrSkOKxejxKB9Al1iQ0TlVLZdqkBRuICpmi0
 MNCg==
X-Gm-Message-State: ACgBeo0/hehzjozV3Ha+ITkThqZeMmMQXrLuErLGf+v4Cdc7MRRA3a2v
 q2dKFELsFBDI7gR1t5xI6hqaYYtLDc27EZFJ/wXDfPDz9w0=
X-Google-Smtp-Source: AA6agR7J79SY1ZqV0A22/aKBr7l3HZNr7jgwoNfQhciQouA18IlkZQ+mFKCQo+sQUy4sS4QVcZnUD3hbn/nQGoJGbMQ=
X-Received: by 2002:a63:fb4a:0:b0:429:8605:6ebf with SMTP id
 w10-20020a63fb4a000000b0042986056ebfmr7942737pgj.225.1660715808418; Tue, 16
 Aug 2022 22:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220313171355.271345-1-james.hilliard1@gmail.com>
 <20220313171355.271345-2-james.hilliard1@gmail.com>
 <d907e04c-19f2-e313-078a-149e122a0011@othermo.de>
In-Reply-To: <d907e04c-19f2-e313-078a-149e122a0011@othermo.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 16 Aug 2022 23:56:35 -0600
Message-ID: <CADvTj4qpFazoyE1g6nwXT226DTWOca4GQ_AqgrpAYPr8vwebmw@mail.gmail.com>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=jcnI/nyWoZvvDUnd9zXg6xWZo8QElRiXt27Va/aufek=;
 b=D4iT8lVGR0sMQ59ZqV//zUcS0cQsmXmQ9x0SnrreoXyCf+va9KclAV3DLAo9CH9scG
 jpHECcLEcPdqHwIYmXFMBWr8puR6KJur0TT1PbNLzDnHG7mYRRXUe205+LRR0+p0pwDg
 6E9EZGIIX6vvV8hQlIaOAQmS8ZJi632KmDa7Vf8Jq/Mg9wDYnNq2N8ugUgf92veXM/cp
 j4eof8emqx9I4/MljFMMwPNCUuEo3SGiujfllATtlRrCW+OsFJkdcA+d9Omi/QkDixt9
 rHdlLyOWjLGZfA5TabtXDdER5qiUBmywlMiU7h5cuE4dweeSmKfdcVzSqkqp5jTjMnVi
 LOhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D4iT8lVG
Subject: Re: [Buildroot] [PATCH v2 2/2] utils/scanpypi: add flit package
 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Aug 16, 2022 at 6:48 PM Marcus Hoffmann
<marcus.hoffmann@othermo.de> wrote:
>
> Hi James,
>
> I needed to package quite a lot of python dependencies, so I tried out
> this patch. There's a number of things missing still here, plus I ended
> up being a bit confused with the pep517 vs flit setup types... maybe you
> could help clarifying this?

Yeah, this is more of an initial flit support patch, not a complete flit support
patch.

>
>
> On 13.03.22 18:13, James Hilliard wrote:
> > These packages don't have a setup.py so we instead need to parse their
> > pyproject.toml file.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes v1 -> v2:
> >    - remove homepage format fixes(sent as separate patch)
> >    - remove load_setup fixes
> >    - move load_pyproject cleanup to finally block
> > ---
> >   utils/scanpypi | 80 ++++++++++++++++++++++++++++++++++++++++++++++++--
> >   1 file changed, 78 insertions(+), 2 deletions(-)
> >
> > diff --git a/utils/scanpypi b/utils/scanpypi
> > index 724e59f759..f501b36232 100755
> > --- a/utils/scanpypi
> > +++ b/utils/scanpypi
> > @@ -42,6 +42,48 @@ except ImportError:
> >             'pip install spdx_lookup')
> >       liclookup = None
> >
> > +def toml_load(f):
> > +    with open(f, 'rb') as fh:
> > +        ex = None
> > +
> > +        # Try regular tomli first
> > +        try:
> > +            from tomli import load
> > +            return load(fh)
> > +        except ImportError as e:
> > +            ex = e
> > +
> > +        # Try pip's vendored tomli
> > +        try:
> > +            from pip._vendor.tomli import load
> > +            try:
> > +                return load(fh)
> > +            except TypeError:
> > +                # Fallback to handle older version
> > +                try:
> > +                    fh.seek(0)
> > +                    w = io.TextIOWrapper(fh, encoding="utf8", newline="")
> > +                    return load(w)
> > +                finally:
> > +                    w.detach()
> > +        except ImportError as e:
> > +            pass
> > +
> > +        # Try regular toml last
> > +        try:
> > +            from toml import load
> > +            fh.seek(0)
> > +            w = io.TextIOWrapper(fh, encoding="utf8", newline="")
> > +            try:
> > +                return load(w)
> > +            finally:
> > +                w.detach()
> > +        except ImportError:
> > +            pass
> > +
> > +        print('This package needs tomli')
> > +        raise ex
>
> Couldn't we just try to use tomli or error out with this message and be
> done with it? Surely users of this script would know how to get tomli
> for their python install?

I mean, we could...but this greatly increases the probability of things
working without having to install additional libraries(as most users will at
least have pip already).

>
> (For what it's worth python 3.11 will ship with a copy of tomli under
> the tomllib module, so we could probably try using that and otherwise
> fall back to requiring tomli)

We'll want to add that once python 3.11 is released, but this should work
reasonably reliably for now.

>
> > +
> >
> >   def setup_decorator(func, method):
> >       """
> > @@ -316,6 +358,37 @@ class BuildrootPackage():
> >               os.chdir(current_dir)
> >               sys.path.remove(self.tmp_extract)
> >
> > +    def load_pyproject(self):
> > +        """
> > +        Loads the corresponding pyproject.toml and store its metadata
> > +        """
> > +        current_dir = os.getcwd()
> > +        os.chdir(self.tmp_extract)
> > +        sys.path.insert(0, self.tmp_extract)
> > +        try:
> > +            pyproject_data = toml_load('pyproject.toml')
> > +            try:
> > +                self.setup_metadata = pyproject_data.get('project', {})
> > +                self.metadata_name = self.setup_metadata.get('name', self.real_name)
> > +                build_system = pyproject_data.get('build-system', {})
> > +                build_backend = build_system.get('build-backend', None)
> > +                if build_backend is not None and build_backend == 'flit_core.buildapi':
>
> This doesn't catch the very common case of having a pyproject.toml which
> requests the setuptools build backend via build-backend =
> "setuptools.build_meta"

Yes, this doesn't touch setuptools at the moment, that does need some
cleanup but IMO best to deal with that after this is merged.

>
> These projects could alternatively be built via the setuptools frontend
> iff they ship with a (stub) setup.py file but it seems better to just
> build them via pep517 anyway, right?

Well there are currently blockers in regards to migrating out setuptools
infrastructure to use pep517 builds, see details:
https://github.com/buildroot/buildroot/commit/4686fb32a053753f502e24c5cd980db5b71f6a2c

>
> Mh, why do we even have flit and pep517 build systems as separate
> options? flit is (at least nowadays) only a pep517 backend (plus a
> frontend which we don't use, I think). (I tried making sense of
> package/pkg-python.mk but I couldn't really see the differerence between
> the pep517 and flit methods)

Well, the setup type is essentially the same as the build backend, we have
a base pep517 setup type for handling non-flit based pep517 build backends.

For example the we use it with the maturin build-backend at the moment(which
doesn't yet have full python infrastructure support):
https://github.com/buildroot/buildroot/blob/2022.08-rc1/package/python-orjson/python-orjson.mk#L10

I do have a pending patch adding pyo3(maturin/setuptools-rust) infra support
here:
https://patchwork.ozlabs.org/project/buildroot/patch/20220807003832.1177015-1-james.hilliard1@gmail.com/

>
> So shouldn't anything that has a pyproject.toml with a [build-system]
> section be pep517?
>
> > +                    self.setup_metadata['method'] = 'flit'
> > +                elif build_system.get('backend-path', None) is not None:
> > +                    self.setup_metadata['method'] = 'pep517' > +                else:
> > +                    self.setup_metadata['method'] = 'unknown'
>
> We are still missing reading out the dependencies for the pyproject.toml
> case, right? Dependencies are currently expected to be in the
> "install_requires" key in the metadata, but in the new world they are
> under 'dependencies'. Easiest would be copying them over right here. The
> format of those dependency specifications seems to be the same. (There's
> also the old-style flit metadata[1] that i.e. fastapi[2] uses for
> dependency specifications, but I don't think that's worth supporting; We
> also don't handle requirements.txt or setup.cfg *shrug*)

Yeah, I'm aware this isn't handling a number of things like dependencies
yet.

>
> > +            except KeyError:
> > +                # This means setup was not called
>
> This comment is wrong here, I believe.

Yeah, I'll remove that.

>
> > +                print('ERROR: Could not determine package metadata for {pkg}.\n'
> > +                      .format(pkg=self.real_name))
> > +                raise
> > +        except FileNotFoundError:
> > +            raise
> > +        finally:
> > +            os.chdir(current_dir)
> > +            sys.path.remove(self.tmp_extract)
> > +
> >       def get_requirements(self, pkg_folder):
> >           """
> >           Retrieve dependencies from the metadata found in the setup.py script of
> > @@ -694,9 +767,12 @@ def main():
> >               except ImportError as err:
> >                   if 'buildutils' in str(err):
> >                       print('This package needs buildutils')
> > +                    continue
> >                   else:
> > -                    raise
> > -                continue
> > +                    try:
> > +                        package.load_pyproject()
> > +                    except Exception as e:
> > +                        raise
> >               except (AttributeError, KeyError) as error:
> >                   print('Error: Could not install package {pkg}: {error}'.format(
> >                       pkg=package.real_name, error=error))
>
> One other thing we'd need to handle here is packages which now ship with
> just a stub setup.py file, i.e. [3]. Those will trigger one
> AttributeError, KeyError and we should in that case just continue on
> with parsing the pyproject.toml.

Yeah, setuptools support def needs some cleanup, was waiting for flit support
to be merged before working on that.

>
>
> [1]: https://flit.pypa.io/en/latest/pyproject_toml.html#old-style-metadata
> [2]: https://github.com/tiangolo/fastapi/blob/0.79.0/pyproject.toml
> [3]: https://github.com/Pylons/waitress/blob/v2.1.2/setup.py
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
