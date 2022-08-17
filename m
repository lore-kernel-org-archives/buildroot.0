Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E600C25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 14:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2EDD610D3;
	Wed, 17 Aug 2022 14:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2EDD610D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V8t-vy0KYT-w; Wed, 17 Aug 2022 14:24:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 953C561063;
	Wed, 17 Aug 2022 14:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 953C561063
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FDF91BF342
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 14:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86AAF4192B
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 14:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86AAF4192B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SrHTTMq74EKf for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 14:24:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D983A41909
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org [195.10.208.55])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D983A41909
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 14:24:13 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4M79Hs0q7rz9t1f;
 Wed, 17 Aug 2022 16:24:09 +0200 (CEST)
Message-ID: <c9212a55-e320-7b0b-4b56-e8998ae9829d@othermo.de>
Date: Wed, 17 Aug 2022 16:24:08 +0200
MIME-Version: 1.0
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220313171355.271345-1-james.hilliard1@gmail.com>
 <20220313171355.271345-2-james.hilliard1@gmail.com>
 <d907e04c-19f2-e313-078a-149e122a0011@othermo.de>
 <CADvTj4qpFazoyE1g6nwXT226DTWOca4GQ_AqgrpAYPr8vwebmw@mail.gmail.com>
Content-Language: en-US
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <CADvTj4qpFazoyE1g6nwXT226DTWOca4GQ_AqgrpAYPr8vwebmw@mail.gmail.com>
X-Rspamd-Queue-Id: 4M79Hs0q7rz9t1f
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1660746249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfLm3D4TBz/CrXDr/2iyKpKp1w5zz8ldjCbp8ZNQFxg=;
 b=YBRxfzo6KiTmCh4sVlxMGNhrEgViD7EFT+q/fNbUb0KRuwHkynTtP+bASzJwqtx+1XYMQ6
 SEyZZokm9LQJIZSZatIZKlUbvWIbDsl+3S3QJCjr7tqdrWjd0MuEeJoQv9M50mhr/ZDuH/
 HZ4M6yFB1037ESurulS0W0tHm4PU5BP07KY3Kepnrae7gPggvJe2u2rkfvm8U0aI5E7xUI
 69j1JB30qw0ie8Ck20U3GkY6waYp6mZj+vE6n/juhShQNBwH+P0OyVhDQ7mh/sKncFwk+s
 EXbGFEF+i6/94owhA4NZQYiXGDiSGrW5XPTeqBBXXcVwtsuAb3pJIANw2bbh6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=YBRxfzo6
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On 17.08.22 07:56, James Hilliard wrote:
> On Tue, Aug 16, 2022 at 6:48 PM Marcus Hoffmann
> <marcus.hoffmann@othermo.de> wrote:
>>

[...]

>> Couldn't we just try to use tomli or error out with this message and be
>> done with it? Surely users of this script would know how to get tomli
>> for their python install?
> 
> I mean, we could...but this greatly increases the probability of things
> working without having to install additional libraries(as most users will at
> least have pip already).
> 
>>
>> (For what it's worth python 3.11 will ship with a copy of tomli under
>> the tomllib module, so we could probably try using that and otherwise
>> fall back to requiring tomli)
> 
> We'll want to add that once python 3.11 is released, but this should work
> reasonably reliably for now.
> 

I'm not a fan of trying to use internal modules of pip, but also not a 
big deal *shrug*.

>>
>>> +
>>>
>>>    def setup_decorator(func, method):
>>>        """
>>> @@ -316,6 +358,37 @@ class BuildrootPackage():
>>>                os.chdir(current_dir)
>>>                sys.path.remove(self.tmp_extract)
>>>
>>> +    def load_pyproject(self):
>>> +        """
>>> +        Loads the corresponding pyproject.toml and store its metadata
>>> +        """
>>> +        current_dir = os.getcwd()
>>> +        os.chdir(self.tmp_extract)
>>> +        sys.path.insert(0, self.tmp_extract)
>>> +        try:
>>> +            pyproject_data = toml_load('pyproject.toml')
>>> +            try:
>>> +                self.setup_metadata = pyproject_data.get('project', {})
>>> +                self.metadata_name = self.setup_metadata.get('name', self.real_name)
>>> +                build_system = pyproject_data.get('build-system', {})
>>> +                build_backend = build_system.get('build-backend', None)
>>> +                if build_backend is not None and build_backend == 'flit_core.buildapi':
>>
>> This doesn't catch the very common case of having a pyproject.toml which
>> requests the setuptools build backend via build-backend =
>> "setuptools.build_meta"
> 
> Yes, this doesn't touch setuptools at the moment, that does need some
> cleanup but IMO best to deal with that after this is merged.
> 
>>
>> These projects could alternatively be built via the setuptools frontend
>> iff they ship with a (stub) setup.py file but it seems better to just
>> build them via pep517 anyway, right?
> 
> Well there are currently blockers in regards to migrating out setuptools
> infrastructure to use pep517 builds, see details:
> https://github.com/buildroot/buildroot/commit/4686fb32a053753f502e24c5cd980db5b71f6a2c
> 

Thanks, that greatly helped me understand the status quo around 
setuptools/pep517 support in builroot :).

>>

[...]

>>
>>> +                    self.setup_metadata['method'] = 'flit'
>>> +                elif build_system.get('backend-path', None) is not None:
>>> +                    self.setup_metadata['method'] = 'pep517' > +                else:
>>> +                    self.setup_metadata['method'] = 'unknown'
>>
>> We are still missing reading out the dependencies for the pyproject.toml
>> case, right? Dependencies are currently expected to be in the
>> "install_requires" key in the metadata, but in the new world they are
>> under 'dependencies'. Easiest would be copying them over right here. The
>> format of those dependency specifications seems to be the same. (There's
>> also the old-style flit metadata[1] that i.e. fastapi[2] uses for
>> dependency specifications, but I don't think that's worth supporting; We
>> also don't handle requirements.txt or setup.cfg *shrug*)
> 
> Yeah, I'm aware this isn't handling a number of things like dependencies
> yet.

That should probably be at least noted in the commit message. Or just 
added to the next revision here.

Adding the following line just makes it work for now, even if that maybe 
isn't an ideal solution:

 > self.setup_metadata['install_requires'] = 
self.setup_metadata.get('dependencies', [])


> 
>>
>>> +            except KeyError:
>>> +                # This means setup was not called
>>
>> This comment is wrong here, I believe.
> 
> Yeah, I'll remove that.
> 
>>
>>> +                print('ERROR: Could not determine package metadata for {pkg}.\n'
>>> +                      .format(pkg=self.real_name))
>>> +                raise
>>> +        except FileNotFoundError:
>>> +            raise
>>> +        finally:
>>> +            os.chdir(current_dir)
>>> +            sys.path.remove(self.tmp_extract)
>>> +
>>>        def get_requirements(self, pkg_folder):
>>>            """
>>>            Retrieve dependencies from the metadata found in the setup.py script of
>>> @@ -694,9 +767,12 @@ def main():
>>>                except ImportError as err:
>>>                    if 'buildutils' in str(err):
>>>                        print('This package needs buildutils')
>>> +                    continue
>>>                    else:
>>> -                    raise
>>> -                continue
>>> +                    try:
>>> +                        package.load_pyproject()
>>> +                    except Exception as e:
>>> +                        raise
>>>                except (AttributeError, KeyError) as error:
>>>                    print('Error: Could not install package {pkg}: {error}'.format(
>>>                        pkg=package.real_name, error=error))
>>
>> One other thing we'd need to handle here is packages which now ship with
>> just a stub setup.py file, i.e. [3]. Those will trigger one
>> AttributeError, KeyError and we should in that case just continue on
>> with parsing the pyproject.toml.
> 
> Yeah, setuptools support def needs some cleanup, was waiting for flit support
> to be merged before working on that

Right, that can happen later.

[...]

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
