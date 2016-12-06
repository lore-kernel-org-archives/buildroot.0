From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 05 Dec 2016 23:35:58 -0200
Subject: [Buildroot] [PATCH 2/3] test/support/download/git: new test
References: <8f2315e4-1622-ce45-991d-81382ffd503f@mind.be>
Message-ID: <584615fea516e_10933fd1ee91d674668d5@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Mon, Dec 05, 2016 at 03:26 PM, Arnout Vandecappelle wrote:

> On 02-12-16 03:34, Ricardo Martincoski wrote:
> [snip]
>>>> +    def check_tarball_exists(self, expected_download):
>>>> +        if self.verbose:
>>>> +            os.system('echo -n "dl: " ; ls package/package/dl/')
>>>> +        return os.path.isfile('package/package/dl/package-' + expected_download + '.tar.gz')
>>>  It would be good to also check the contents of the tarball. That way the
>>> submodule stuff is immediately covered as well.
>> Indeed. This is the only one I am not sure how I will do in the test infra, but
>> should not be too hard. I will keep this suggestion in mind when rewriting the
>> tests.
> 
>  Here's a hint:
> 
> 	import tarfile
> 	with tarfile.open(expected_download) as tf:
> 		files = tf.getnames()
> 		...

Thank you very much.

Regards,
Ricardo
