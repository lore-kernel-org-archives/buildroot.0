From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 30 Apr 2019 09:19:08 -0400
Subject: [Buildroot] [PATCH 00/11] Python: update several packages.
Message-ID: <20190430131919.130128-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Several of these packages I am under the DEVELOPER file for, and I use on a
daily basis. My own personal projects use Flask, sqlalchemy, psycopg2, pip,
mutagen, and jinja, and as such I am confident that they have been thoroughly
tested, and of course, every package passed with test-pkg as well.

Also, as many of these packages were quite old, they also lacked hash's for
their license files, so I fixed those as well.

As an added bonsus, I updated setuptools as well.

Comments are of course, always welcome!

Adam

Adam Duskett (11):
  package/python{3}-setuptools: bump to version 41.0.1
  package/python-markupsafe: bump to version 1.1.1
  package/python-werkzeug: bump to version 0.15.2
  package/python-pip: bump to version 19.1
  package/python-psycopg2: bump to version 2.8.2
  package/python-itsdangerous: bump to version 1.1.0
  package/python-mutagen: bump to version 1.42.0
  package/python-jinja2: bump to version 2.10.1
  package/python-flask: bump to version 1.0.2
  package/python-sqlalchemy: bump to version .3.3
  package/python-flask-sqlalchemy: bump to version 2.3.2

 .../python-flask-sqlalchemy.hash              |  6 ++--
 .../python-flask-sqlalchemy.mk                |  4 +--
 package/python-flask/python-flask.hash        |  5 +--
 package/python-flask/python-flask.mk          |  4 +--
 .../python-itsdangerous.hash                  |  6 ++--
 .../python-itsdangerous.mk                    |  7 +++--
 package/python-jinja2/python-jinja2.hash      |  4 +--
 package/python-jinja2/python-jinja2.mk        |  5 +--
 .../python-markupsafe/python-markupsafe.hash  |  6 ++--
 .../python-markupsafe/python-markupsafe.mk    |  6 ++--
 package/python-mutagen/python-mutagen.hash    |  5 +--
 package/python-mutagen/python-mutagen.mk      |  4 +--
 package/python-pip/python-pip.hash            |  4 +--
 package/python-pip/python-pip.mk              |  4 +--
 ...id-installing-tests-to-site-packages.patch | 31 -------------------
 package/python-psycopg2/Config.in             |  1 -
 package/python-psycopg2/python-psycopg2.hash  |  6 ++--
 package/python-psycopg2/python-psycopg2.mk    |  5 ++-
 .../python-setuptools/python-setuptools.hash  |  4 +--
 .../python-setuptools/python-setuptools.mk    |  4 +--
 .../python-sqlalchemy/python-sqlalchemy.hash  |  6 ++--
 .../python-sqlalchemy/python-sqlalchemy.mk    |  4 +--
 package/python-werkzeug/python-werkzeug.hash  |  5 +--
 package/python-werkzeug/python-werkzeug.mk    |  6 ++--
 .../python3-setuptools/python3-setuptools.mk  |  4 +--
 25 files changed, 57 insertions(+), 80 deletions(-)
 delete mode 100644 package/python-psycopg2/0001-setup.py-avoid-installing-tests-to-site-packages.patch

-- 
2.20.1
