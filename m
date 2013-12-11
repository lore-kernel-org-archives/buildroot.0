From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 11 Dec 2013 19:12:01 +0100
Subject: [Buildroot] [PATCH 1/1] package: make package download from
 Mercurial repositories more robust
In-Reply-To: <CAAXf6LVU9OJtS2-Pbr0ect35RRvFd3fY4643ZhsDf-dSGj-RYg@mail.gmail.com>
References: <1386700290-4813-1-git-send-email-mathias.demare@gmail.com>
 <CAAXf6LVU9OJtS2-Pbr0ect35RRvFd3fY4643ZhsDf-dSGj-RYg@mail.gmail.com>
Message-ID: <CAAXf6LVBGJj_=Tns7O-9XF05OJ8NU0DCAfpPtFRQdMV7NJMNeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 10, 2013 at 9:10 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> On Tue, Dec 10, 2013 at 7:31 PM, Mathias De Mar?
> <mathias.demare@gmail.com> wrote:
>> Previously, when cloning a Mercurial repository,
>> aborting the clone could (in some cases) leave behind an empty directory.
>> As a result, a later clone would fail.
>>
>> Signed-off-by: Mathias De Mar? <mathias.demare@gmail.com>
>> ---
>>  package/pkg-download.mk | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
>> index 758b211..c00689b 100644
>> --- a/package/pkg-download.mk
>> +++ b/package/pkg-download.mk
>> @@ -178,6 +178,7 @@ endef
>>  define DOWNLOAD_HG
>>         test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
>>         (pushd $(DL_DIR) > /dev/null && \
>> +       rm -rf $($(PKG)_BASE_NAME) && \
>>         $(HG) clone --noupdate --rev $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
>>         $(HG) archive --repository $($(PKG)_BASE_NAME) --type tgz --prefix $($(PKG)_BASE_NAME)/ \
>>                       --rev $($(PKG)_DL_VERSION) $(DL_DIR)/$($(PKG)_SOURCE) && \
>
> Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

It seems that patchwork did not pick up this ack, nor the reply
itself... Is this a known issue?
