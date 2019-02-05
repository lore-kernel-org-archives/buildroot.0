From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 04 Feb 2019 22:53:49 -0200
Subject: [Buildroot] [PATCH v5 05/10] testing/tests/download: test case
 for git refs
References: <428c323b-041c-aa42-6b7d-9e0c704f47c3@mind.be>
Message-ID: <5c58de9de6572_290e2ab5f52236b8124d0@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Feb 04, 2019 at 05:48 PM, Arnout Vandecappelle wrote:

> On 12/05/2018 04:58, Ricardo Martincoski wrote:
> [snip]
>>  create mode 100644 support/testing/tests/download/br2-external/git-refs/Config.in
>>  create mode 100644 support/testing/tests/download/br2-external/git-refs/external.desc
>>  create mode 100644 support/testing/tests/download/br2-external/git-refs/external.mk
> 
>  I don't think it makes a whole lot of sense to make a separate external for
> this; it would seem easier to put everything in a single external (and move the
> br2_external setting to GitTestBase). But that can be fixed in a follow-up
> patch, so applied to master, thanks.

I don't remember if there was any reason to keep them separate.
Indeed it seems they can be merged. I will add to my todo list.

> 
> [snip]
>> +    def check_download(self, package):
>> +        # store downloaded tarball inside the output dir so the test infra
>> +        # cleans it up at the end
>> +        env = {"BR2_DL_DIR": os.path.join(self.builddir, "dl"),
>> +               "GITREMOTE_PORT_NUMBER": str(self.gitremote.port)}
>> +        self.b.build(["{}-dirclean".format(package),
>> +                      "{}-legal-info".format(package)],
> 
>  Here there's also a refactoring opportunity, since this function only differs
> with check_hash in this one line.

I will take a look.


Regards,
Ricardo
